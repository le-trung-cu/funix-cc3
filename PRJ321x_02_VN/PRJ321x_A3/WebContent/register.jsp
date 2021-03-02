<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12/dist/vue.js"></script>
<%
String username = session.getAttribute("user") != null ? (String) session.getAttribute("user") : "duongdt@fpt.com.vn";
%>
<div id="form-login" class="login-box">
	<h1>Register</h1>
	<form action='<c:url value="/register"/>' method="post"
		@submit="submit">
		<strong><%=session.getAttribute("error") != null ? session.getAttribute("error") : ""%></strong>
		<p class="form-group">
			<label for="mail">Email:</label> <input v-model:values="mail"
				id="mail" name="mail" placeholder="email">
			<mark class="error">{{errorMail}}</mark>
		</p>
		<p class="form-group">
			<label for="password">PassWord:</label> <input
				v-model:value="password" id="password" type="password"
				name="password" placeholder="your address">
			<mark class="error">{{errorPassword}}</mark>
		</p>
		<p class="form-group">
			<label for="address">Address:</label> <input v-model:value="address"
				id="address" type="text" name="address" placeholder="your password">
			<mark class="error">{{errorAddress}}</mark>
		</p>
		<p class="form-group">
			<label for="phone">Phone:</label> <input v-model:value="phone"
				id="phone" type="tel" name="phone" placeholder="your phone">
			<mark class="error">{{errorPhone}}</mark>
		</p>
		<button>login</button>
	</form>
</div>

<script>
var app = new Vue({
	  el: '#form-login',
	  data() {
	    return {
	      mail: 'ss',
	      password: 's',
	      address: '',
	      phone: '',
	      errorMail: '',
	      errorPassword: '',
	      errorAddress: '',
	      errorPhone: ''
	    }
	  },
	  methods: {
	    submit(e) {
	      let validate = this.validatePassword(this.password);
	      validate = this.validateMail(this.userName) && validate;
	      validate = this.validateAdress(this.userName) && validate;
	      validate = this.validatePhone(this.userName) && validate;

	      if (!validate) {
	        e.preventDefault();
	        return;
	      }
	    },
	    validateMail() {
	      this.errorMail = '';
	      var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	      if (!this.mail.match(mailformat)) {
	        this.errorMail = 'You have entered an invalid email address!';
	        return false;
	      }
	      return true;
	    },
	    validatePassword() {
	      this.errorPassword = '';
	      if (this.password.length > 0) {
	        return true;
	      }
	      this.errorPass = 'Password must be at least 1 characters in length'
	      return false;
	    },
	    validateAdress() {
	      this.errorAddress = '';
	      if (this.address.length > 0) {
	        return true;
	      }
	      this.errorPass = 'Adress must be at least 1 characters in length'
	      return false;
	    },
	    validatePhone() {
	      this.errorPhone = '';
	      const phoneformat = /^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s\./0-9]*$/g;
	      if (!this.phone.match(phoneformat)) {
	        this.errorPhone = 'You have entered an invalid phone number!';
	        return false;
	      }
	      return true;
	    }
	  }
	})
  </script>
<jsp:include page="footer.jsp" />