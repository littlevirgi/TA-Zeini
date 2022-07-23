<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    function __construct()
    {
        parent::__construct();
         if(!$this->session->userdata('login_admin')){
            redirect('admin/login');
        }
    }

    function index(){
        $data['active']     = 'dash';
        $data['judul_1']    = 'Dashboard';
        $data['judul_2']    = 'Selamat Datang';
        $data['page']       = 'v_dashboard';
        $data['menu']       = $this->Menus->generateMenu();
        $data['breadcumbs'] = array(
            array(
                'nama'=>'Dashboard',
                'icon'=>'fa fa-dashboard',
                'url'=>'admin/dashboard'
            ),
        );
        $nowDate = date('Y-m-d');
        $getPoli = $this->db->get('kategori_poli')->result();
            foreach ($getPoli as $key) {
                $this->db->limit('1');
                $this->db->where('id_poli',$key->id_poli);
                $this->db->where('tgl_antrian_poli',$nowDate);
                $this->db->order_by('no_antrian_poli','DESC');
                $antrianpoli = $this->db->get('antrian_poli')->row();

                if($key->id_poli == 1){
                    if($antrianpoli){
                        $data['poli_umum'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_umum'] = 0;
                    }
                }elseif($key->id_poli == 2){
                    if($antrianpoli){
                        $data['poli_gigi'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_gigi'] = 0;
                    }
                }elseif($key->id_poli == 3){
                    if($antrianpoli){
                        $data['poli_gizi'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_gizi'] = 0;
                    }
                  }elseif($key->id_poli == 4){
                    if($antrianpoli){
                        $data['poli_konseling'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_konseling'] = 0;
                    }
                     }elseif($key->id_poli == 5){
                    if($antrianpoli){
                        $data['poli_tb'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_tb'] = 0;
                    } 
                  }elseif($key->id_poli == 6){
                    if($antrianpoli){
                        $data['poli_anak'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_anak'] = 0;
                    }
                  }elseif($key->id_poli == 7){
                    if($antrianpoli){
                        $data['poli_kia'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_kia'] = 0;
                    }
                  }elseif($key->id_poli == 8){
                    if($antrianpoli){
                        $data['poli_kb'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_kb'] = 0;
                    }
                }elseif($key->id_poli == 9){
                    if($antrianpoli){
                        $data['poli_kesehatan'] = $antrianpoli->no_antrian_poli;

                    }else{
                        $data['poli_kesehatan'] = 0;
                    }
                }
            }

        $this->load->view('admin/'.$this->session->userdata('theme').'/v_index',$data);
    }
}