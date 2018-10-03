var app = feathers();
// Connect to a different URL
var restClient = feathers.rest('http://localhost:3030')

// Configure an AJAX library (see below) with that client
app.configure(restClient.fetch(window.fetch));
app.configure(feathers.authentication({
  storage: window.localStorage
}));

const appDom = document.querySelector("#app");

const signUpHTML = `<form>
      <input type="email" name="email" placeholder="Enter Email Here"/>
      <input type="password" name="pass" placeholder="Enter Password Here"/>
      <lable>Coach</lable><input type="checkbox" name="coach"/>
      <button type="button" name="signUp" id="signup">Sign Up</button>
      <button type="button" id="gotoLogin">Already Have An Account?</button>
    </form>`


const loginHTML = `<form>
          <input type="email" name="email" placeholder="Enter Email Here"/>
          <input type="password" name="pass" placeholder="Enter Password Here"/>
          <button type="button" name="login" id="login">Login</button>
          <button type="button" id="goToSignUp">Don't have an account?</button>
        </form>`

const getCredentials = () => {

  const email = document.querySelector('[name="email"]').value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;').replace(/>/g, '&gt;');

  const password = document.querySelector('[name="pass"]').value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;').replace(/>/g, '&gt;');
  let coach = 0;
  try {
    coach = BoolToInt(document.querySelector('[name="coach"]').checked);
  } catch {}
  const user = {
    email: email,
    password: password,
    isCoach: coach,
  }
  return user;
};

const BoolToInt = value => {
  if (value === true) {
    return 1;
  }

  if (value === false) {
    return 0;
  }

  return value;
};

const login = async credentials => {
  try {
    if (!credentials) {
      // Try to authenticate using the JWT from localStorage
      await app.authenticate();
      displayLoggedin();
    } else {
      // If we get login information, add the strategy we want to use for login
      const payload = Object.assign({
        strategy: 'local'
      }, credentials);

      await app.authenticate(payload);
      displayLoggedin();
    }
  } catch (error) {
    // If we got an error, show the login page
    displayLogin(error);
  }
};

document.addEventListener('click', async ev => {
  switch (ev.target.id) {
    case 'signup':
      {
        // For signup, create a new user and then log them in
        const credentials = getCredentials();

        // First create the user
        await app.service("users").create(credentials);
        // If successful log them in
        await login(credentials);
        break;
      }
    case 'login':
      {
        const user = getCredentials();

        await login(user);
        break;
      }

    case 'goToSignUp':
      {
        displaySignUp();
        break;
      }
    case 'gotoLogin':
      displayLogin();
      break;
  }
});

const displaySignUp = () => {
  appDom.innerHTML = signUpHTML
}
const displayLogin = (error) => {
  appDom.innerHTML = loginHTML;
  if (error) {
    console.error(error);
  }
}
const displayLoggedin = () => {
  appDom.innerHTML =
    `<h1>Logged In</h1>
    <button type="button" onclick="app.logout(); appDom.innerHTML = loginHTML">Logout</button>`
}
login();