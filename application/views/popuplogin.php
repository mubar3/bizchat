<div id="id01" class="modal">
  <?php
  include "css/styllogin.css";?>
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content animate" action="<?php echo base_url().'crud/ceklogin'; ?>" method="post">


    <div class="container">
      <h2>LOGIN</H2>
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="name" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="pass" required>

      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>
