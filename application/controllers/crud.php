<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class crud extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	function __construct()
	     {
	         parent::__construct();
	         $this->load->model('crud_model');
	         $this->load->helper('url');
	     }

			 function index()
		 {
			 $this->load->view('home');
		 }

			 function simpanregis()
			 {
			 	$a=$this->input->post('name');
			 	$b=$this->input->post('email');
			 	$c=$this->input->post('pass');
				$d=$this->input->post('jenis');

			 	$data = array(
			 								'name'  =>$a,
			 								'email' =>$b,
			 								'pass' =>$c,
											'jenis'=>$d
			 						);

			 	$this->crud_model->save($data,'akun');
			 	redirect();
			 }




			 function ceklogin()
			 {
				 $username = $this->input->post('name');
		$password = $this->input->post('pass');
		$where = array(
			'name' => $username,
			'pass' => $password
			);
		$cek = $this->crud_model->cek_login("akun",$where)->num_rows();
		if($cek > 0){

			$data_session = array(
				'nama' => $username,
				'status' => "login"
				);

			$this->session->set_userdata($data_session);

			redirect(base_url("welcome"));

		}else{
			echo "Username dan password salah !";
		}




				 }
		 }
