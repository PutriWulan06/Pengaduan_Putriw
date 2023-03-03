<?= $this->extend('layouts/admin') ?>
<?= $this->section('title') ?>
Masyarakat
<?= $this->endSection() ?>
<?= $this->section('content') ?>

<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-gradient-dark">
                    <h3>Masyarakat</h3>
                    <!-- <a href="" data-toggle="modal" data-target="#fmasyarakat" data-masyarakat="add" class="btn btn-secondary">Tambah Data</a> -->
                </div>
                <div class="card-body">
                    <table class="table table-boarder">
                        <tr>
                            <th>No</th>
                            <th>Nik</th>
                            <th>Nama</th>
                            <th>Username</th>
                            <th>Telp</th>
                            <th>Aksi</th>
                        </tr>
                        <?php
                        $no = 0;
                        foreach ($masyarakat as $row) {
                            $data = $row['id_masyarakat'] . "," .$row['nik'] . "," .$row['nama'] . "," . $row['username'] . "," . $row['password'] . "," . $row['telp'] . "," . base_url('/masyarakat/edit/' . $row['id_masyarakat']);
                            # code ... 
                            $no++;
                        ?>
                            <tr>
                                <td><?= $no ?></td>
                                <td><?= $row['nik'] ?></td>
                                <td><?= $row['nama'] ?></td>
                                <td><?= $row['username'] ?></td>
                                <td><?= $row['telp'] ?></td>
                                <td>
                                    <a href="" data-toggle="modal" data-target="#fmasyarakat" class="btn btn-primary" data-masyarakat="<?= $data ?>">Edit</a>
                                    <a href="/masyarakat/delete/<?= $row['id_masyarakat'] ?>" onclick="return confirm('Yakin ingin hapus data ?')" class="btn btn-danger">Hapus</a>
                                </td>
                            </tr>
                        <?php
                        }
                        ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <?php if (!empty(session()->getFlashdata("message"))) : ?>
        <div class="alert alert-success">
            <?= session()->getFlashdata("message") ?>
        </div>
    <?php endif ?>
</div>
<div class="modal fade" id="fmasyarakat" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="moal-header">
                <h5 class="modal-title" id="exampleModalLabel">Form Edit Masyarakat</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" id="editMasyarakat" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nik">Nik</label>
                        <input type="number" name="nik" id="nik" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="nama">Nama</label>
                        <input type="text" name="nama" id="nama" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" name="username" id="username" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="telp">Telp</label>
                        <input type="number" name="telp" id="telp" value="" class="form-control">
                    </div>
                </div>
                <div class="form-group" id="ubahpassword">
                    <label for="ubahpassword">Ubah Password</label>
                    <input type="checkbox" name="ubahpassword" aria-label="Mau Ubah Password" class="form-control">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<?= $this->endSection() ?>
<?= $this->section('script') ?>
<script>
    $(document).ready(function() {
        $("#fmasyarakat").on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var data = button.data('masyarakat');

            if (data != "add") {
                const barisdata = data.split(",");
                $("#nik").val(barisdata[1]);
                $("#nama").val(barisdata[2]);
                $("#username").val(barisdata[3]);
                $("#password").val(barisdata[4]);
                $("#telp").val(barisdata[5]);
                $("#editMasyarakat").attr('action', barisdata[6]);
                $("#ubahpassword").show();
            } else {
                $("#nik").val("");
                $("#nama").val("");
                $("#username").val("");
                $("#password").val("");
                $("#telp").val("");
                $("#editMasyarakat").attr('action', "masyarakat");
            }
        });
    })
</script>
<?= $this->endSection() ?>