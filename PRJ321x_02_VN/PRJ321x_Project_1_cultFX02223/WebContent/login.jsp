<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12/dist/vue.js"></script>

<div id="form-login" class="login-box">
	<h1>Login</h1>
	<form action="login" method="post" @submit="submit">
		
		<p class="form-group">
			<label for="username">User Name:</label> <input
				v-model:values="userName" id="username" name="username"
				placeholder="user name">
			<mark class="error">{{errorUserName}}</mark>
		</p>
		<p class="form-group">
			<label for="password">PassWord:</label> <input
				v-model:value="password" id="password" type="password"
				name="password" placeholder="your password">
			<mark class="error">{{errorPass}}</mark>
		</p>
		<div>
			<input class="" type="checkbox" name="remember" id="remember">
			<label for="remember">Remember me</label>
		</div>
		<button>login</button>
	</form>
</div>

<script>
    var app = new Vue({
      el: '#form-login',
      data() {
        return {
          userName: '',
          password: '',
          errorUserName: '',
          errorPass: ''
        }
      },
      methods: {
        submit(e) {
          let validate = this.validatePass(this.password);
          validate = this.validateUserName(this.userName) && validate;
          if (!validate) {
            e.preventDefault();
            return;
          }
        },
        validateUserName(username) {
          this.errorUserName = '';
          if (username.length > 0) {
            return (true)
          }
          this.errorUserName = 'User name must be at least 1 characters in length';
          return (false)
        },
        validatePass(pass = '') {
          this.errorPass = '';
          if (pass.length > 0) {
            return true;
          }
          this.errorPass = 'Password must be at least 1 characters in length'
          return false;
        }
      }
    })
  </script>
<jsp:include page="footer.jsp" />