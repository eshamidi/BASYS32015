webtalk_init -webtalk_dir E:/ECEC302/Projects/threshgate/threshgate.hw/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Wed Oct 21 17:20:21 2015" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "Vivado v2015.2 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "1266856" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "210821937_1777496420_210614112_042" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "5588258e-1a94-4e84-a5f2-8a278227bbaa" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "8aeadeae-fb07-45ec-90fd-f5cc0d3f0ed9" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "6" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 7 , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Service Pack 1  (build 7601)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i7-3770 CPU @ 3.40GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3392 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "17.000 GB" -context "user_environment"
webtalk_register_client -client labtool
webtalk_add_data -client labtool -key cable -value "Digilent/Basys3/15000000" -context "labtool\\usage"
webtalk_add_data -client labtool -key chain -value "0362D093" -context "labtool\\usage"
webtalk_add_data -client labtool -key pgmcnt -value "01:00:00" -context "labtool\\usage"
webtalk_transmit -clientid 3895932081 -regid "210821937_1777496420_210614112_042" -xml E:/ECEC302/Projects/threshgate/threshgate.hw/webtalk/usage_statistics_ext_labtool.xml -html E:/ECEC302/Projects/threshgate/threshgate.hw/webtalk/usage_statistics_ext_labtool.html -wdm E:/ECEC302/Projects/threshgate/threshgate.hw/webtalk/usage_statistics_ext_labtool.wdm -intro "<H3>LABTOOL Usage Report</H3><BR>"
webtalk_terminate
