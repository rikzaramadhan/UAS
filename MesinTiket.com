package view;

import java.util.Scanner;

public class MesinTiketFrame {
    double harga, total, diskon, bayar, kembalian;
    int pilih, jumlah;
    String nama, tujuan;
    
    double hitungtotal (int jml ){
       jumlah = jml;
       switch(pilih){
            case 0:
                System.exit(0);
                break;
            case 1:
                harga = 585000;
                total = total+(harga*jml);
                break;
            case 2:
                harga = 332000;
                total = total+(harga*jml);
                break;
            case 3:
                harga = 190000;
                total = total+(harga*jml);
                break;
            case 4:
                harga = 1333999;
                total = total+(harga*jml);
                break;
            default:
                System.out.println("ERROR: input yang anda masukan salah !");
        }
        return total;
    }

    public String Nama (String nm){
        nama = nm;
        Scanner nama = new Scanner(System.in);
        nm = nama.nextLine();
        return nm;
    }
    
    public String Tujuan (String tjn){
        nama = tjn;
        Scanner tujuan = new Scanner(System.in);
        tjn = tujuan.nextLine();
        return tjn;
    }
    
    void viewTujuan (){
        System.out.println("Kota tujuan :");
    }
    
    void viewTotal (){
        System.out.println("-----------------------------------");
        System.out.println("            Pembayaran              ");
        System.out.println("-----------------------------------");
        System.out.println("Total : Rp." + total);
    }
    
    double hitungKembalian(double byr){
        bayar = byr;
        kembalian = byr-total;
        return kembalian;
    }
    
    void viewKembalian (){
        System.out.println("Kembalian : Rp." + kembalian);
        System.out.println("------------------------------------");
        System.out.println("            Terima Kasih            ");
        System.out.println("------------------------------------");
    }    
    
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        MesinTiketFrame in = new MesinTiketFrame();
        System.out.println("------------------------------------------------------------------------");
        System.out.println("                              MENU TIKET                               ");
        System.out.println("------------------------------------------------------------------------");
        System.out.println("No Transportasi                                         Harga");
        System.out.println("1. Pesawat                                              Rp 585.000");
        System.out.println("2. KeReta Api                                           Rp 332.000");
        System.out.println("3. Bus                                                  Rp 190.000");
        System.out.println("4. Air Space                                            Rp 1.333.999");
        System.out.println("_________________________________________________________________________");
        System.out.println("                                DISKON                                  ");
        System.out.println("- Setiap Pembelian Tiket di jam 08.00-09.00 disemua Transportasi : 1-2%");
        System.out.println("- Nama Lengkap lebih dari 10 Karakter tanpa spasi : 1% ");
        System.out.println("- Memiliki nama yang sama dengan salah satu Transportasi : 1%");
        System.out.println("- Jarak antar Suarabaya dengan kota pilihan dibawah ini :");
        System.out.println("    A. Jakarta : 800-900 X 4%");
        System.out.println("    B. Amerika : 1500-200 X 6%");
        System.out.println("    C. Bandung : 600-500 X 8%");
        System.out.println("--------------------------------------------------------------------------");
        System.out.println("Masukan nama : " + nama);
        System.out.println("Kota tujuan : " + tujuan);
        System.out.print("Menggunakan Transportasi :");
        
        
        in.pilih = scan.nextInt();
        if(in.pilih>=1 && in.pilih<=4){
            System.out.print("Jumlah tiket yang Beli :");
            in.jumlah = scan.nextInt();
            
        }else{
        }
        in.hitungtotal(in.jumlah);
        
        in.viewTotal();
        System.out.print("Bayar : Rp.");
        in.bayar = scan.nextDouble();
        in.hitungKembalian(in.bayar);
        in.viewKembalian();
            
    }
}    
