tgt_dir=~/sc_db_github_files/candles_nse_intraday_supertrend_rsi
rm -rf $tgt_dir
mkdir -p $tgt_dir

echo "Analysing FNO GAINERS....."
python3 scripts/scan_nse_live_analysis.py --ofile /tmp/__x.csv --key fno_gainers
python3 scripts/scan_security_list_technical.py --invs scripts/db/investing_dot_com_security_dict.py --lag 10 --res 5m --sfile /tmp/__x.csv --plots_dir $tgt_dir --strategy scanner --strategy_name supertrend_rsi_long

echo "Analysing FNO LOSERS....."
python3 scripts/scan_nse_live_analysis.py --ofile /tmp/__y.csv --key fno_losers
python3 scripts/scan_security_list_technical.py --invs scripts/db/investing_dot_com_security_dict.py --lag 10 --res 5m --sfile /tmp/__y.csv --plots_dir $tgt_dir --strategy scanner --strategy_name supertrend_rsi_short
