<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\Pengaduan;
use App\Models\Tanggapan;

class PengaduanController extends BaseController
{

    protected $pengaduann, $tanggapans;

    function __construct()
    {
        $this->pengaduann = new Pengaduan();
        $this->tanggapans = new Tanggapan();
    }

    public function index()
    {
        if (session()->get('level') == 'masyarakat') {
            $data['pengaduan'] = $this->pengaduann->where(['nik' => session()->get('nik')])->findAll();
        } else {
            $data['pengaduan'] = $this->pengaduann->findAll();
        }
        return view('pengaduan_view', $data);
    }

    public function save()
    {
        if (empty($_FILES['foto']['name'])) {
            $data = [
                'tgl_pengaduan' => date('Y-m-d H:i:s'),
                'nik' => session()->get('nik'),
                'isi_laporan' => $this->request->getPost('isi_laporan'),
                'foto' => "",
                'status' => '0',
            ];
        } else {
            $dataBerkas = $this->request->getFile('foto');
            $filename = $dataBerkas->getRandomName();
            $data = [
                'tgl_pengaduan' => date('Y-m-d H:i:s'),
                'nik' => session()->get('nik'),
                'isi_laporan' => $this->request->getPost('isi_laporan'),
                'foto' => $filename,
                'status' => '0',
            ];
            $dataBerkas->move('upload/berkas', $filename);
        }
        $this->pengaduann->insert($data);

        return redirect('pengaduan');
    }

    public function delete($id)
    {
        $this->pengaduann->delete($id);
        return $this->response->redirect('/pengaduan');
    }
}
