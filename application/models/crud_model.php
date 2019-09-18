<?php

class crud_model extends CI_Model
{
  function save($data,$table)
  {

      $this->db->insert($table,$data);

  }

  function cek_login($table,$where){
  		return $this->db->get_where($table,$where);
  	}


    }
