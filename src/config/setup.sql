
-- SINH VIEN
DROP TABLE IF EXISTS SINHVIEN;
CREATE TABLE SINHVIEN (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaSV            VARCHAR(255) NOT NULL UNIQUE,
    Hoten           VARCHAR(255),
    Ngaysinh        DATE,
    Gioitinh        VARCHAR(255),
    MaThietbi       VARCHAR(255) UNIQUE,
    MaFCM           VARCHAR(255) UNIQUE,
    Matkhau         VARCHAR(255),
    PRIMARY KEY(ID)
);

-- KHOA
DROP TABLE IF EXISTS KHOA;
CREATE TABLE KHOA (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaKhoa          VARCHAR(255) NOT NULL UNIQUE,
    TenKhoa         VARCHAR(255) UNIQUE,
    PRIMARY KEY(ID) 
);

-- PHONGHOC
DROP TABLE IF EXISTS PHONGHOC;
CREATE TABLE PHONGHOC (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaPH            VARCHAR(255) NOT NULL UNIQUE,
    TenPH           VARCHAR(255),
    Diachi          VARCHAR(255),
    PRIMARY KEY(ID) 
);

-- CAHOC
DROP TABLE IF EXISTS CAHOC;
CREATE TABLE CAHOC (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaCH            VARCHAR(255) NOT NULL UNIQUE,
    GioBatdau       VARCHAR(255),
    GioKetthuc      VARCHAR(255),
    PRIMARY KEY(ID) 
);

-- GIANGVIEN
DROP TABLE IF EXISTS GIANGVIEN;
CREATE TABLE GIANGVIEN (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaGV            VARCHAR(255) NOT NULL UNIQUE,
    IDKhoa          INT NOT NULL UNIQUE,
    Hoten           VARCHAR(255),
    Ngaysinh        DATE,
    Gioitinh        VARCHAR(255),
    MaThietbi       VARCHAR(255) UNIQUE,
    MaFCM           VARCHAR(255) UNIQUE,
    PRIMARY KEY(ID),
    FOREIGN KEY (IDKhoa) REFERENCES KHOA(ID)
);

-- MONHOC
DROP TABLE IF EXISTS MONHOC;
CREATE TABLE MONHOC (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaMH            VARCHAR(255) NOT NULL UNIQUE,
    TenMonhoc       VARCHAR(255) UNIQUE,
    Tongsotiet      INT,
    Tietlythuyet    INT,
    Tietthuchanh    INT,
    PRIMARY KEY(ID) 
);

-- LOPMONHOC
DROP TABLE IF EXISTS LOPMONHOC;
CREATE TABLE LOPMONHOC (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaLopMonhoc     VARCHAR(255) NOT NULL UNIQUE,
    IDGiangvien     INT NOT NULL UNIQUE,
    TenLopmonhoc    VARCHAR(255) UNIQUE,
    PRIMARY KEY(ID),
    FOREIGN KEY (IDGiangvien) REFERENCES GIANGVIEN(ID)
);


-- GV_DIEMDANH_SV
DROP TABLE IF EXISTS GV_DIEMDANH_SV;
CREATE TABLE GV_DIEMDANH_SV (
    ID              INT NOT NULL AUTO_INCREMENT,
    MaDiemDanh      VARCHAR(255) NOT NULL UNIQUE,
    IDGiangvien     INT NOT NULL UNIQUE,
    IDLopmonhoc     INT NOT NULL UNIQUE,
    Ngaydiemdanh    Date,
    Thoidiembatdau  Date,
    PRIMARY KEY(ID),
    FOREIGN KEY (IDGiangvien) REFERENCES GIANGVIEN(ID),
    FOREIGN KEY (IDLopmonhoc) REFERENCES LOPMONHOC(ID)
);

-- MONHOC_LOPMONHOC
DROP TABLE IF EXISTS MONHOC_LOPMONHOC;
CREATE TABLE MONHOC_LOPMONHOC (
    ID              INT NOT NULL AUTO_INCREMENT,
    IDMonhoc        INT NOT NULL UNIQUE,
    IDLopmonhoc     INT NOT NULL UNIQUE,
    Namhoc          VARCHAR(255),
    Hocky           VARCHAR(255),
    PRIMARY KEY(ID),
    FOREIGN KEY (IDLopmonhoc) REFERENCES LOPMONHOC(ID),
    FOREIGN KEY (IDMonhoc) REFERENCES MONHOC(ID)
);

-- CA_PHONG_LOPMONHOC
DROP TABLE IF EXISTS CA_PHONG_LOPMONHOC;
CREATE TABLE CA_PHONG_LOPMONHOC (
    ID              INT NOT NULL AUTO_INCREMENT,
    IDCahoc         INT NOT NULL UNIQUE,
    IDPhonghoc      INT NOT NULL UNIQUE,
    IDLopmonhoc     INT NOT NULL UNIQUE,
    Thu             VARCHAR(255),
    PRIMARY KEY(ID),
    FOREIGN KEY (IDCahoc) REFERENCES CAHOC(ID),
    FOREIGN KEY (IDPhonghoc) REFERENCES PHONGHOC(ID),
    FOREIGN KEY (IDLopmonhoc) REFERENCES LOPMONHOC(ID)
);

-- CHITIETDD
DROP TABLE IF EXISTS CHITIETDD;
CREATE TABLE CHITIETDD (
    ID              INT NOT NULL AUTO_INCREMENT,
    IDDiemdanh      INT NOT NULL UNIQUE,
    IDSinhvien      INT NOT NULL UNIQUE,
    Thoigiandiemdanh    VARCHAR(255),
    Lydo            VARCHAR(255),
    PRIMARY KEY(ID),
    FOREIGN KEY (IDDiemdanh) REFERENCES GV_DIEMDANH_SV(ID),
    FOREIGN KEY (IDSinhvien) REFERENCES SINHVIEN(ID)
);

-- SINHVIEN_HOC_LOPMONHOC
DROP TABLE IF EXISTS SINHVIEN_HOC_LOPMONHOC;
CREATE TABLE SINHVIEN_HOC_LOPMONHOC (
    ID              INT NOT NULL AUTO_INCREMENT,
    IDLopmonhoc     INT NOT NULL UNIQUE,
    IDSinhvien      INT NOT NULL UNIQUE,
    Kichhoat        BOOLEAN,
    PRIMARY KEY(ID),
    FOREIGN KEY (IDLopmonhoc) REFERENCES LOPMONHOC(ID),
    FOREIGN KEY (IDSinhvien) REFERENCES SINHVIEN(ID)
);