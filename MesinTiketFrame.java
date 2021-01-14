package view;

import controller.MesinTiketService;
import model.menu;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MesinTiketFrame extends JFrame implements MesinTiketService {

    private JLabel jlNama = new JLabel("Masukan Nama Anda");
    private JLabel jlJenis_Kendaraan = new JLabel("Masukan kendaraan yang anda mau pesan ");
    private JLabel jlHarga = new JLabel("Masukan berapa tiket yang anda beli ");
    private JLabel jlDiskon = new JLabel("Masukan berapa tiket yang anda beli ");
    private JLabel jlTujuan= new JLabel("Masukan berapa tiket yang anda beli ");
    private JTextField jtfNama = new JTextField(50);
    private JTextField jtfJenis_Kendaraan = new JTextField(50);
    private JTextField jtfHarga = new JTextField(50);
    private JTextField jtfDiskon = new JTextField(50);
    private JTextField jtfTujuan = new JTextField(50);
    private final JButton jbPesan = new JButton("Pesan");
    
    private JLabel jlStatusPesan = new JLabel("");
    
    private String nama;
    private String jenis_kendaraan;
    private String harga;
    private String diskon;
    private String tujuan;

    menu menu;

    public MesinTiketFrame() {
        super("Mesin Tiket");
        initView();
        doMesinTiket();

    private void initView() {
        JPanel base = new JPanel(new GridBagLayout());

        GridBagConstraints constraints = new GridBagConstraints();
        constraints.anchor = GridBagConstraints.WEST;

        constraints.gridx = 0;
        constraints.gridy = 0;
        base.add(jlNama, constraints);

        constraints.gridx = 1;
        base.add(jtfNama, constraints);

        constraints.gridx = 0;
        constraints.gridy = 1;
        base.add(jlJenis_Kendaraan, constraints);

        constraints.gridx = 1;
        base.add(jlJenis_Kendaraan, constraints);

        constraints.gridx = 0;
        constraints.gridy = 3;
        base.add(jlStatusPesan, constraints);

        constraints.gridx = 1;
        constraints.gridy = 3;
        constraints.gridwidth = 2;
        constraints.anchor = GridBagConstraints.CENTER;
        base.add(jbPesan, constraints);

        base.setBorder(BorderFactory.createTitledBorder(
                BorderFactory.createEtchedBorder(), " Machine Tiket"));

        add(base);

        pack();
        setLocationRelativeTo(null);
    }

    

    