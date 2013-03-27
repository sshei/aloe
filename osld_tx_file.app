main:
{
	/* if selected, each module is called waveform_granularity_us/time_slot times per timeslot */
	/* if set to non-zero, the platform time slot must be integer divisible of waveform_granularity_us */
	waveform_granularity_us=0;
	
	precach_pipeline=false;
	auto_ctrl_module="ctrl";
};

modules:
{
	
	ctrl:
	{
		binary="modrep_osld/liblte_ctrl.so";	
		mopts=0.1;
		variables=(
			{name="nof_output_data_itf";value=1},
			{name="mode";value=2}, /* 0 tx, 1 rx, 2 both */
			{name="mcs";value=0},{name="nrb";value=4},{name="fft_size";value=128},
			
			{name="cfi_tx";value=1},{name="cfi_rx";value=-1},
			
			{name="nof_ports";value=1},
			{name="nof_prb";value=6;},
			{name="cell_id";value=0},{name="nof_osymb_x_subf";value=14},
			
			{name="delay_pdsch_rx_demodulator";value=1},
			{name="delay_pdsch_rx_descrambling";value=1},
			{name="delay_pdsch_rx_unratematching";value=1},
			{name="delay_resdemapp_pdsch";value=1},
			
			{name="delay_resdemapp_pdcch";value=0}
		);
	};
		
	source:
	{
		binary="modrep_default/libsource.so";	
		mopts=8;
		variables=(
			{name="block_length";value=120},{name="generator";value=0}
		);
	};
	
	pcfich_tx:
	{
		include="../aloe_git/pcfich_tx.app";	
	};

	pdcch_tx:
	{
		include="../aloe_git/pdcch_tx.app";	
	};
	
	pdsch_tx:
	{
		include="../aloe_git/pdsch_tx.app";	
	};

	resmapp:
	{
		binary="modrep_osld/liblte_resource_mapper.so";	
		mopts=15;
		variables=(
			{name="subframe_idx";value=0},
			{name="nof_pdcch";value=1},{name="pdcch_nofcce_0";value=2}
		);
	};
	
	demux_tx:
	{
		binary="modrep_osld/libgen_demux.so";	
		mopts=12;
		variables=(
			{name="nof_outputs";value=14;},{name="data_type";value=2;});
	};
	
	symb_tx:
	{
		include="../aloe_git/symb_tx.app";	
	};
	
	sink:
	{
		binary="modrep_default/libfile_sink.so";	
		mopts=5;
		variables=(
		{name="data_type";value=1}, /* set to 2 if quant is enabled */
		{name="file_name";value="./pss_new.txt"},
		{name="gain";value=1.0},
		{name="mode";value=0},
		{name="freq_samp";value=1920000.0;});
	};	

};

join_stages=
(
	("ctrl","source","pcfich_tx_coder","pcfich_tx_modulator","pcfich_tx_scrambling","pdcch_tx_crc","pdcch_tx_coder","pdcch_tx_ratematching","pdcch_tx_scrambling","pdcch_tx_modulator","pdsch_tx_crc_tb","pdsch_tx_coder","pdsch_tx_ratematching","pdsch_tx_scrambling","pdsch_tx_modulator","resmapp","demux_tx"),
	("symb_tx_ifft_0","symb_tx_cyclic_first_0"),
	("symb_tx_ifft_1","symb_tx_cyclic_0"),
	("symb_tx_ifft_2","symb_tx_cyclic_1"),
	("symb_tx_ifft_3","symb_tx_cyclic_2"),
	("symb_tx_ifft_4","symb_tx_cyclic_3"),
	("symb_tx_ifft_5","symb_tx_cyclic_4"),
	("symb_tx_ifft_6","symb_tx_cyclic_5"),
	("symb_tx_ifft_7","symb_tx_cyclic_first_1"),
	("symb_tx_ifft_8","symb_tx_cyclic_6"),
	("symb_tx_ifft_9","symb_tx_cyclic_7"),
	("symb_tx_ifft_10","symb_tx_cyclic_8"),
	("symb_tx_ifft_11","symb_tx_cyclic_9"),
	("symb_tx_ifft_12","symb_tx_cyclic_10"),
	("symb_tx_ifft_13","symb_tx_cyclic_11")
);

interfaces:
(	
	{src="ctrl";dest="pdcch_tx"},
	
	{src="source";dest="pdsch_tx"},
	{src="pdsch_tx";dest=("resmapp",0)},
	{src="pcfich_tx";dest=("resmapp",1)},
	{src="pdcch_tx";dest=("resmapp",2)},
		
	{src="resmapp";dest="demux_tx"},
	
	{src=("demux_tx",0);dest=("symb_tx",0)},	
	{src=("demux_tx",1);dest=("symb_tx",1)},	
	{src=("demux_tx",2);dest=("symb_tx",2)},	
	{src=("demux_tx",3);dest=("symb_tx",3)},	
	{src=("demux_tx",4);dest=("symb_tx",4)},	
	{src=("demux_tx",5);dest=("symb_tx",5)},	
	{src=("demux_tx",6);dest=("symb_tx",6)},	
	{src=("demux_tx",7);dest=("symb_tx",7)},	
	{src=("demux_tx",8);dest=("symb_tx",8)},	
	{src=("demux_tx",9);dest=("symb_tx",9)},	
	{src=("demux_tx",10);dest=("symb_tx",10)},	
	{src=("demux_tx",11);dest=("symb_tx",11)},	
	{src=("demux_tx",12);dest=("symb_tx",12)},	
	{src=("demux_tx",13);dest=("symb_tx",13)},	

	{src="symb_tx";dest="sink"}
);
