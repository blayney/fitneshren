var app = feathers();
// Connect to a different URL
var restClient = feathers.rest('http://localhost:3030')

// Configure an AJAX library (see below) with that client
app.configure(restClient.fetch(window.fetch));

const appDom = document.querySelector("#app");

const signUpHTML = `<form>
      <input type="email" name="email" placeholder="Enter Email Here"/>
      <input type="password" name="pass" placeholder="Enter Password Here"/>
      <lable>Coach</lable><input type="radio"/>
      <button type="button" name="signUp" id="signup">Sign Up</button>
      <button type="button" id="goToSignUp">Already Have An Account?</button>
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
  const user = {
    email: email,
    password: password,
  };

  return user;
};

const login = async credentials => {
  try {
    if (!credentials) {
      // Try to authenticate using the JWT from localStorage
      await app.authenticate();
    } else {
      // If we get login information, add the strategy we want to use for login
      const payload = Object.assign({
        strategy: 'local'
      }, credentials);

      await app.authenticate(payload);
    }
  } catch (error) {
    // If we got an error, show the login page
    displayLogin();
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
        displayLoggedin();

        break;
      }
    case 'login':
      {
        const user = getCredentials();

        await login(user);

        displayLoggedin();
        break;
      }

    case 'goToSignUp':
      displaySignUp();
      break;
  }
});

const displaySignUp = () => {
  appDom.innerHTML = signUpHTML
}
const displayLogin = () => {
  appDom.innerHTML = loginHTML
}
const displayLoggedin = () => {
  appDom.innerHTML =
    '<h1>Logged In</h1>';
}

login();