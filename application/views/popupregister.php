<div id="id02" class="modal">
  <?php
  include "css/stylregis.css";?>
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form  class="modal-content animate" action="<?php echo base_url().'crud/simpanregis'; ?>" method="post">
    <div class="container">
      <h1>Sign Up</h1>
      <p>Please fill in this form to create an account.</p>
      <hr>
      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter Name" name="name" required>

      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="pass" required>

      <label for="psw"><b>Jenis Akun</b></label><br>
      <input type="radio" name="jenis" value="bisni" checked /> Bisnis
      <input type="radio" name="jenis" value="biasa" /> Biasa
      <br><br>

      <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
      </label>

      <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
        <button input type="submit" class="signupbtn">Sign Up</button>
      </div>
    </div>
  </form>
</div>
