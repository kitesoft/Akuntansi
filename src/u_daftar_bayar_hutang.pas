unit u_daftar_bayar_hutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, sSkinProvider, Buttons, sSpeedButton, ExtCtrls, sPanel,
  sButton, StdCtrls, MemDS, DBAccess,
  MyAccess, cxCustomData, cxFilter, cxData, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator;

type
  Tf_daftar_bayar_hutang = class(TForm)
    sPanel1: TsPanel;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    sknprvdr1: TsSkinProvider;
    ds_rinci_bayar_hutang: TDataSource;
    Q_rinci_bayar_hutang: TMyQuery;
    ds_bayar_hutang: TDataSource;
    Q_bayar_hutang: TMyQuery;
    grid: TcxGrid;
    t_data0: TcxGridDBTableView;
    t_data0tgl: TcxGridDBColumn;
    t_data0no_refrensi: TcxGridDBColumn;
    t_data0keterangan: TcxGridDBColumn;
    t_data0debet: TcxGridDBColumn;
    t_data2: TcxGridDBTableView;
    t_data2Column1: TcxGridDBColumn;
    t_data2Column2: TcxGridDBColumn;
    t_data2Column3: TcxGridDBColumn;
    t_data2Column4: TcxGridDBColumn;
    t_data2Column5: TcxGridDBColumn;
    l_data: TcxGridLevel;
    l_data2: TcxGridLevel;
    p1: TsPanel;
    sButton3: TsButton;
    procedure segarkan;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_daftar_bayar_hutang: Tf_daftar_bayar_hutang;

implementation

uses
  u_dm, u_utama, UFungsi;

{$R *.dfm}

procedure Tf_daftar_bayar_hutang.segarkan;
begin
  fungsi.SQLExec(Q_bayar_hutang,
    'select * from tb_jurnal_global where kd_perusahaan= ''' + 
    dm.kd_perusahaan + ''' and refr=''PH'' and month(tgl)=''' + dm.Bulan
    + ''' and year(tgl)=''' + dm.Tahun + '''', true);

  fungsi.SQLExec(Q_rinci_bayar_hutang,
    'select * from vw_jurnal_rinci  where kd_perusahaan= ''' + 
    dm.kd_perusahaan + ''' and refr=''PH'' and bulan=''' + dm.Bulan +
    ''' and tahun=''' + dm.Tahun + '''', true);
end;

procedure Tf_daftar_bayar_hutang.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (dm.metu_kabeh) then
  begin
    if Assigned(active) then
    begin
      idx := f_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
      f_utama.tc_child.Tag := -1;
      f_utama.tc_child.TabIndex := idx;
      f_utama.tc_child.Tag := 0;
    end;
  end;
end;

procedure Tf_daftar_bayar_hutang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  Action := caFree;
  f_daftar_bayar_hutang := nil;
end;

procedure Tf_daftar_bayar_hutang.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(Self.Handle);
end;

procedure Tf_daftar_bayar_hutang.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_daftar_bayar_hutang.sb_2Click(Sender: TObject);
var
  posisi: Integer;
begin
  posisi := t_data0.DataController.DataSource.DataSet.RecNo;
  segarkan;
  t_data0.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure Tf_daftar_bayar_hutang.sButton3Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jurnal_rinci where kd_perusahaan= "' + dm.kd_perusahaan
    + '" and bulan= "' + dm.Bulan + '" and tahun="' + 
    dm.Tahun + '" and refr="PH"', true);

  dm.laporan.LoadFromFile(dm.Path + 'laporan\a_jurnal_global.fr3');
  dm.FRMemo(dm.laporan, 'Memo2').Text := 'TRANSAKSI JURNAL BAYAR HUTANG';
  dm.laporan.ShowReport;
end;

end.

