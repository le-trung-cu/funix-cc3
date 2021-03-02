<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contain">
    <footer class="footer">
      <div class="footer__top">
        <div class="footer__group">
          <h3>Information</h3>
          <a class="item" href="#">About</a>
          <a class="item" href="#">Privacy Policy</a>
        </div>
        <div class="footer__group">
          <h3>My Account</h3>
          <a class="item" href="#">My Account</a>
          <a class="item" href="#">Order History</a>
        </div>
        <div class="footer__group">
          <h3>Newsletter</h3>
          <p class="item">Subscribe to our newsletter to receive new updates, and another stuff:</p>
          <form class="subscribe" action="subscribe" method="post">
            <input type="email">
            <button class="btn btn--big">Subscribe</button>
          </form>
        </div>
      </div>
      
      <div class="footer__bottom">
        <p>Codding by: Fx2003</p>
      </div>
    </footer>
  </div>
</body>

</html>
<% session.setAttribute("message", null); %>