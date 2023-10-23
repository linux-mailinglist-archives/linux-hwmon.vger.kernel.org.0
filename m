Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823E07D376D
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 Oct 2023 15:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjJWNHW (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 23 Oct 2023 09:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjJWNHV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2023 09:07:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921E497;
        Mon, 23 Oct 2023 06:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698066436; x=1729602436;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=NDF5+7GPJhKJx67/ssUg5eCpI1PdhvEawUbWLAo6Oeo=;
  b=ja/hZL6Kr2HvAW+gvhcH/sp0vLjqccL1bIZqeV7TArs3Xz/JuCd9aRDW
   h2+VjXiw0ED5vUOhFDMFceO7uCuDG7q+6U/5BYM8PLuvG2DljYkCTBN2m
   823+RXtGvbK6eXVZr3qaxPG6hLhEUygYSz3z8/VXWAB5q//r3Y0TG15rg
   yjOyIe5I90mAFeTsL8vjoRNat7ixkWiZUpa8u7aqEacBVtIfsrvV8VYrE
   tA1Z6TKdJH7NpaJZ4WTjygoIeVvNnHJx8dyY5ykcqfCtvaqpYBIswrL2g
   FxtyfluKCe6pjyMNgmROvCeY7nzJlfrmWKpryOeoYNo7Jn6+xhrYX8+oz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="453304293"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="453304293"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 06:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="901795422"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="901795422"
Received: from foliveix-mobl5.amr.corp.intel.com ([10.251.211.194])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 06:04:52 -0700
Date:   Mon, 23 Oct 2023 16:07:08 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Henry Shi <henryshi2018@gmail.com>
cc:     hbshi69@hotmail.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, Hans de Goede <hdegoede@redhat.com>,
        markgross@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        hb_shi2003@yahoo.com, henrys@silicom-usa.com, wenw@silicom-usa.com
Subject: Re: [PATCH v9] platform/x86: Add Silicom Platform Driver
In-Reply-To: <20231021145332.7039-1-henryshi2018@gmail.com>
Message-ID: <77c5b0d1-c15a-d0ec-f47e-1fbaf832e99e@linux.intel.com>
References: <20231021145332.7039-1-henryshi2018@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1420067774-1698064437=:1721"
Content-ID: <fe4b7286-c237-3693-f890-63e484e143e@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1420067774-1698064437=:1721
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <d9362777-4ee-d647-e894-df795f47f93@linux.intel.com>

On Sat, 21 Oct 2023, Henry Shi wrote:

> platform/x86: Add Silicom Platform Driver
> 
> Add Silicom platform (silicom-platform) Linux driver for Swisscom
> Business Box (Swisscom BB) as well as Cordoba family products.
> 
> This platform driver provides support for various functions via
> the Linux LED framework, GPIO framework, Hardware Monitoring (HWMON)
> and device attributes.
> 
> Signed-off-by: Henry Shi <henryshi2018@gmail.com>
> ---
> 
> Changes from v1 to v2:
> ===========================
> 
> Suggested by Hans de Goede <hdegoede@redhat.com>
> .Use git send-email to submit patch.
> .patch contents should be in message body.
> .Kconfig bit for the driver should be in drivers/platform/x86/Kconfig.
> 
> changes from patch v2 to v3
> ===========================
> 
> changes suggested by Guenter Roeck <groeck7@gmail.com>
> .Removed unnecessary include file linux/thermal.h.
> .Removed EXPORT_SYMBOL for mutex lock/unlock function.
> 
> Changes suggested by Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>
> .Remove extra new line in code on multiple position.
> .Use table instead of space in code.
> .Uss Linux defined bit operation MACRO define.
> .Removed local variable in rpm_get().
> .Corrected typo in comments.
> .Corrected incorrect indentation.
> .Removed unnecessary comments in silicom_mc_leds_register().
> .Rewrite efuse_status_show() to used defined variable and removed 
> uncessary local variables.
> .Rewrite uc_version_show() to used defined variable and removed 
> uncessary local variables.
> .Removed unused MACRO define: #define CHANNEL_TO_BIT(chan) ((chan) & 0x07).
> .Rewrite powercycle_uc() to used defined variable and removed uncessary 
> local variables.
> .use GENMASK() and use FIELD_GET() instead of bit shift.
> .Added define for constant 0x28 used in  efuse_status_show().
> .Added define for constant 0x0 used in  uc_version_show().
> .Added define for constant 0x0 used in  powercycle_uc().
> .Rearrange functions to avoid uncessary pre-define.
> .Rewrite rpm_get() to used defined variable and removed uncessary 
> local variables.
> .Rewrite temp_get() to used defined variable and removed uncessary 
> local variables.
> .Use FIELD_GET instead of bit shift in temp_get().
> .Used #define for constant variable 0/1.
> 
> Changes suggested by Christophe JAILLET <christophe.jaillet@wanadoo.fr>:
> .use "if (!led->subled_info)" instead of
> "if (IS_ERR_OR_NULL(led->subled_info))
> "in silicom_mc_leds_register
> 
> changes from patch v3 to v4
> ===========================
> 
> changes suggested by Guenter Roeck <groeck7@gmail.com>
> 
> Changes suggested by Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>:
> .Rewrite silicom_mec_led/gpip_set/get() functions to use two newly created
> silicom_mec_port_get()/silicom_mec_port_set() which have common code.
> .Remove duplicate code in silicom_mec_port_get()
> .Rewrite uc_version_show() to use Linux bit operation MACRO, and add
> logic to check un-supported register value.
> .Added "#define MEC_EFUSE_LSB_ADDR 0x28" and "#define
> MEC_POWER_CYCLE_ADDR 0x24"
> .Added "#define MEC_VERSION_MAJOR GENMASK(15, 14)" and "#define
> MEC_VERSION_MINOR GENMASK(13, 8)".
> 
> Changes suggested by Christophe JAILLET <christophe.jaillet@wanadoo.fr>:
> .Used a local variable to store "sizeof(struct mc_subled)" in function
> silicom_mc_leds_register().
> 
> change from patch v4 to v5
> ===========================================
> 
> changes suggested by Guenter Roeck <groeck7@gmail.com>:
> .Corrected return value in temp_get() to return 1/10000th degree.
> .Removed local variable struct silicom_fan_control_data *ctl in
> silicom_fan_control_read_fan(),
> removed storing rpm value to ctl variable.
> .Removed local variable struct silicom_fan_control_data *ctl in 
> silicom_fan_control_read_temp(),
> .removed storing rpm value to ctl variable.
> .Changed return string in silicom_fan_control_read_labels() to 
> specific string for Silicom platform driver.
> .Removed silicom_fan_control_data structure.
> .Removed static variable mec_io_base and mec_io_len, and added
> "#define MEC_IO_BASE 0x0800 and #define MEC_IO_LEN 0x8".
> .Removed ".write = NULL" in silicom_fan_control_hwmon_ops
> structure defination.
> .Removed unnecessary function silicom_fan_control_write().
> .Removed unnecessary check for silicom_led_info in function
> silicom_platform_probe.
> .Removed unnecessary local variable "silicom_fan_control_data *ctl"
> in silicom_platform_probe().
> .Clean out driver initialization error handling in
> silicom_platform_init();
> .Add patch version and changelog for patch submission.
> 
> Changes suggested by Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>:
> .Rename "#define MEC_DATA(offset) to "#define MEC_DATA_OFFSET(offset).
> .Use constant defined in include/linux/units.h instead of a literal.
> .return directly instead of go to err condition when
> platform_device_register_simple() failed.
> .Remove unnecessary check for silicom_led_info and silicom_gpiochip.
> .Use a local variable to how multiple use of array size.
> .Align the arguments to the same column in
> silicom_mec_led_mc_brightness_set.
> .Add patch version and changelog that shows version to version changes
> for patch submission.
> 
> Changes suggested by Christophe JAILLET <christophe.jaillet@wanadoo.fr>:
> .Use "sizeof(*led)" instead of "sizeof(struct led_classdev_mc)"
> .Use "if (!led)" instead of "if (IS_ERR_OR_NULL(led))" 
> .Removed unnecessary error message:
> "dev_err(dev, "Failed to alloc led_classdev_mc[%d]:
> %ld\n", i, PTR_ERR(led)).
> 
> change from patch vv5 to v6
> ===========================================
> 
> changes suggested by Guenter Roeck <groeck7@gmail.com>:
> .Removed checkpath warnings. 
> .Resoved dependencies between CONFIG_HWMON and CONFIG_SILICOM_PLATFORM.
> 
> change from patch v6 to v7
> ===========================================
> 
> changes suggested by Hans de Goede <hdegoede@redhat.com>:
> .Usa a proper subsystem prefix for this patch subject:
> Subject: platform/x86: Add Silicom Platform Driver.
> 
> change from patch v7 to v8
> ===========================================
> 
> changes suggested by Hans de Goede <hdegoede@redhat.com>:
> .Chnage commit message of this driver.
> .Adjust location of change log and signed-off-by.
> .Change "config SILICOM_PLATFORM" and help contents location,
> and put it to source "drivers/platform/x86/siemens/Kconfig".
> .Set editor tab to 8 and align the start of extra function
> parameters to directly after (. This should be applied for
> all function.
> .Do not manually create a sysfs dir and register sysfs attribute,
> instead define a platform_driver structure.
> .Move MODULE_DEVICE_TABLE(dmi, silicom_dmi_ids) directly after
> table declaration.
> .Using pr_info() instead of dev_info() in function
> silicom_platform_info_init().
> .Made dmi_check_system() check the first thing to do in
> silicom_platform_init().
> .Instead of separate platform_device creation + driver registration,
> switched to using platform_create_bundle().
> .Removed mutex_destroy(&mec_io_mutex).
> 
> 
> Changes suggested by Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>:
> .Too many GENMASK() within to code itself, need put them to
> #define. Removed all GENMASK() in c functions.
> 
> change from patch v8 to v9 (current patch)
> ===========================================
> 
> Changes suggested by Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>:
> .Just do the same (like MEC_VERSION_MAJOR) with all places in the where
> you previously had GENMASK() in the code (currently MEC_GET_BITS()
> is there, obviously, but it should go away and be replaced with
> FIELD_GET(GOODPREFIX_GOODNAME, ...))).
> .This is sysfs so it's odd to print pr_err() like that here. If the driver
> does not support those versions at all, the probe should fail. If driver is
> fine but just doesn't know how to interpret such a version, you should
> return -Esomething here. Driver returns -EINVAL here.
> .Replace CENTI with 100
> .Align FIELD_GET()s to the same column for line 661.
> .Change variables efuse_status, mec_uc_version, power_cycle to unsigned
> int from int.
> 
> changes suggested by Hans de Goede <hdegoede@redhat.com>:
> .Please add a Documentation/ABI/testing/sysfs-platform-silicom
> file to document driver specific the sysfs attributes of this driver.
> .Like with the Kconfig part, group this together with the other industrial
> PC drivers we have at the end of the Makefile after Siemens
> Simatic Industrial PCs.
> 
>  .../ABI/testing/sysfs-platform-silicom        |  265 +++++
>  drivers/platform/x86/Kconfig                  |   14 +
>  drivers/platform/x86/Makefile                 |    3 +
>  drivers/platform/x86/silicom-platform.c       | 1002 +++++++++++++++++
>  4 files changed, 1284 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-silicom
>  create mode 100644 drivers/platform/x86/silicom-platform.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-silicom b/Documentation/ABI/testing/sysfs-platform-silicom
> new file mode 100644
> index 000000000000..4c5e0974aea7
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-silicom
> @@ -0,0 +1,265 @@
> +What:		/sys/devices/platform/silicom-platform/uc_version
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file allows to read microcontroller firmware
> +		version of current platform.
> +
> +What:		/sys/devices/platform/silicom-platform/power_cycle
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +		This file allow user to power cycle the platform.
> +		default value is 0; when set to 1, it powers down
> +		the platform, wait 5 seconds, then power on the
> +		device.
> +
> +What:		/sys/devices/platform/silicom-platform/efuse_status
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns the current
> +		OTP status:
> +
> +		0 - not programmed.
> +		1 - programmed.
> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/
> +		temp1_input
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns the temperature
> +		of device.
> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/
> +		temp1_label
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns "Silicom_platform:
> +		Thermostat Sensor".
> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/
> +		fan1_input
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns current fan
> +		speed (RPM).
> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/
> +		fan1_label
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns "Silicom_platform:
> +		Fan Speed".
> +
> +What:		/sys/class/leds/multicolor:sys/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of system LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:sys/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only  file. It returns:
> +
> +		white amber red
> +
> +What:		/sys/class/leds/multicolor:sys/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of system LED: First value for
> +		color white; Second value for color amber and third value
> +		for color red:
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:wan/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of WAN LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:wan/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only file. It returns:
> +
> +		white yellow red
> +
> +What:		/sys/class/leds/multicolor:wan/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of WAN LED: First value for
> +		color white; Second value for color yellow and third value
> +		for color red:
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:stat%d/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of device status LED (number %d) brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:stat%d/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only file. It returns:
> +
> +		red green blue yellow
> +
> +What:		/sys/class/leds/multicolor:stat%d/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of device status LED (number %d):
> +		First value for color red; Second value for color green;
> +		Third value for color blue and fourth value for color
> +		yellow.
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:fp_left/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of left LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:fp_left/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only  file. It returns:
> +
> +		red green blue amber
> +
> +What:		/sys/class/leds/multicolor:fp_left/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of left LED: First value for
> +		color red; Second value for color green; Third value for
> +		color blue and fourth value for color amber.
> +		for color red:
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:fp_center/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of left LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:fp_center/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only  file. It returns:
> +
> +		red green blue amber
> +
> +What:		/sys/class/leds/multicolor:fp_center/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of left LED: First value for
> +		color red; Second value for color green; Third value for
> +		color blue and fourth value for color amber.
> +		for color red:
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:fp_right/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of left LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:fp_right/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only  file. It returns:
> +
> +		red green blue amber
> +
> +What:		/sys/class/leds/multicolor:fp_right/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of left LED: First value for
> +		color red; Second value for color green; Third value for
> +		color blue and fourth value for color amber.
> +		for color red:
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> \ No newline at end of file

Add the missing newline.

> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2a1070543391..f38fbd97f33d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1076,6 +1076,20 @@ config INTEL_SCU_IPC_UTIL
>  
>  source "drivers/platform/x86/siemens/Kconfig"
>  
> +config SILICOM_PLATFORM
> +	tristate "Silicom Edge Networking device support"
> +	depends on HWMON
> +	select LEDS_CLASS_MULTICOLOR
> +	help
> +	  This option enables support for the LEDs/GPIO/etc downstream of the
> +	  embedded controller on Silicom "Cordoba" hardware and derivatives.
> +
> +	  This platform driver provides support for various functions via
> +	  the Linux LED framework, GPIO framework, Hardware Monitoring (HWMON)
> +	  and device attributes.
> +
> +	  If you have a Silicom network appliance, say Y or M here.
> +
>  config WINMATE_FM07_KEYS
>  	tristate "Winmate FM07/FM07P front-panel keys driver"
>  	depends on INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index b457de5abf7d..8fdb0c7d8ca1 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -133,6 +133,9 @@ obj-$(CONFIG_X86_INTEL_LPSS)		+= pmc_atom.o
>  # Siemens Simatic Industrial PCs
>  obj-$(CONFIG_SIEMENS_SIMATIC_IPC)	+= siemens/
>  
> +# Silicom
> +obj-$(CONFIG_SILICOM_PLATFORM)		+= silicom-platform.o
> +
>  # Winmate
>  obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
>  
> diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
> new file mode 100644
> index 000000000000..9d8e690006a8
> --- /dev/null
> +++ b/drivers/platform/x86/silicom-platform.c
> @@ -0,0 +1,1002 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// silicom-platform.c - Silicom MEC170x platform driver
> +//
> +// Copyright (C) 2023 Henry Shi <henrys@silicom-usa.com>
> +#include <linux/dmi.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/ioport.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/hwmon.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/string.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/units.h>
> +
> +#define MEC_EFUSE_LSB_ADDR 0x28
> +#define MEC_POWER_CYCLE_ADDR 0x24

Order the these so they're in increasing order.

> +#define MEC_PORT_OFFSET_MASK 0xfc
> +#define MEC_PORT_CHANNEL_MASK 0x7
> +#define MEC_DATA_OFFSET_MASK 0x03
> +#define MEC_GPIO_IN_POS 0x08
> +#define MEC_IO_BASE 0x0800
> +#define MEC_IO_LEN 0x8
> +#define MEC_ADDR ((MEC_IO_BASE) + 0x02)
> +#define MEC_DATA_OFFSET(offset) ((MEC_IO_BASE) + 0x04 + (offset))
> +#define EC_ADDR_LSB MEC_ADDR
> +#define EC_ADDR_MSB ((MEC_IO_BASE) + MEC_DATA_OFFSET_MASK)

Is this really correct because it doesn't make much sense to me? It 
currently calculates "io base" + mask of some field called "MEC data 
offset". Should it be e.g. (MEC_ADDR + 1) instead?

Also, you don't need to have parenthesis around MEC_IO_BASE.

It would also be nice to add a linebreak or two into this long block of 
defines, perhaps before OFFSET_BIT_TO_CHANNEL() at least since it relates 
to declarations.

> +#define SILICOM_MEC_MAGIC 0x5a
> +#define OFFSET_BIT_TO_CHANNEL(off, bit) ((((off) + 0x014) << 3) | (bit))
> +#define CHANNEL_TO_OFFSET(chan) (((chan) >> 3) - 0x14)
> +#define MEC_VERSION_MAJOR GENMASK(15, 14)
> +#define MEC_VERSION_MINOR GENMASK(13, 8)
> +#define MEC_PREFIX_NAME GENMASK(31, 3)

These are getting into the right direction. I'm not entirely sure if 
MEC_NAME really is a name, because it would suggest it's some 
human-readable string which it isn't.

What that field is called in the HW spec? Perhaps somehow derive the 
define name out of it by adding MEC prefix.

Remove "PREFIX" from the names (I used it just to tell you one should 
not add defines like VERSION_MAJOR but prefix them with something so
MEC_VERSION_MAJOR).

> +#define MEC_PREFIX_HIGH_BYTES GENMASK(31, 16)
> +#define MEC_PREFIX_SEC_BYTE GENMASK(15, 8)

> +#define IO_REG_BANK 0x0
> +#define DEFAULT_CHAN_LO 0
> +#define DEFAULT_CHAN_HI 0
> +#define DEFAULT_CHAN_LO_T 0xc
> +
> +static DEFINE_MUTEX(mec_io_mutex);
> +static unsigned int efuse_status;
> +static unsigned int mec_uc_version;
> +static unsigned int power_cycle;
> +
> +static const struct hwmon_channel_info *silicom_fan_control_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +struct silicom_platform_info {
> +	int io_base;
> +	int io_len;
> +	struct led_classdev_mc *led_info;
> +	struct gpio_chip *gpiochip;
> +	u8 *gpio_channels;
> +	u16 ngpio;
> +};
> +
> +static const char * const plat_0222_gpio_names[] = {
> +	"AUTOM0_SFP_TX_FAULT",
> +	"SLOT2_LED_OUT",
> +	"SIM_M2_SLOT2_B_DET",
> +	"SIM_M2_SLOT2_A_DET",
> +	"SLOT1_LED_OUT",
> +	"SIM_M2_SLOT1_B_DET",
> +	"SIM_M2_SLOT1_A_DET",
> +	"SLOT0_LED_OUT",
> +	"WAN_SFP0_RX_LOS",
> +	"WAN_SFP0_PRSNT_N",
> +	"WAN_SFP0_TX_FAULT",
> +	"AUTOM1_SFP_RX_LOS",
> +	"AUTOM1_SFP_PRSNT_N",
> +	"AUTOM1_SFP_TX_FAULT",
> +	"AUTOM0_SFP_RX_LOS",
> +	"AUTOM0_SFP_PRSNT_N",
> +	"WAN_SFP1_RX_LOS",
> +	"WAN_SFP1_PRSNT_N",
> +	"WAN_SFP1_TX_FAULT",
> +	"SIM_M2_SLOT1_MUX_SEL",
> +	"W_DISABLE_M2_SLOT1_N",
> +	"W_DISABLE_MPCIE_SLOT0_N",
> +	"W_DISABLE_M2_SLOT0_N",
> +	"BT_COMMAND_MODE",
> +	"WAN_SFP1_TX_DISABLE",
> +	"WAN_SFP0_TX_DISABLE",
> +	"AUTOM1_SFP_TX_DISABLE",
> +	"AUTOM0_SFP_TX_DISABLE",
> +	"SIM_M2_SLOT2_MUX_SEL",
> +	"W_DISABLE_M2_SLOT2_N",
> +	"RST_CTL_M2_SLOT_1_N",
> +	"RST_CTL_M2_SLOT_2_N",
> +	"PM_USB_PWR_EN_BOT",
> +	"PM_USB_PWR_EN_TOP",
> +};
> +
> +static u8 plat_0222_gpio_channels[] = {
> +	OFFSET_BIT_TO_CHANNEL(0x00, 0),
> +	OFFSET_BIT_TO_CHANNEL(0x00, 1),
> +	OFFSET_BIT_TO_CHANNEL(0x00, 2),
> +	OFFSET_BIT_TO_CHANNEL(0x00, 3),
> +	OFFSET_BIT_TO_CHANNEL(0x00, 4),
> +	OFFSET_BIT_TO_CHANNEL(0x00, 5),
> +	OFFSET_BIT_TO_CHANNEL(0x00, 6),
> +	OFFSET_BIT_TO_CHANNEL(0x00, 7),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 0),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 1),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 2),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 3),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 4),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 5),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 6),
> +	OFFSET_BIT_TO_CHANNEL(0x01, 7),
> +	OFFSET_BIT_TO_CHANNEL(0x02, 0),
> +	OFFSET_BIT_TO_CHANNEL(0x02, 1),
> +	OFFSET_BIT_TO_CHANNEL(0x02, 2),
> +	OFFSET_BIT_TO_CHANNEL(0x09, 0),
> +	OFFSET_BIT_TO_CHANNEL(0x09, 1),
> +	OFFSET_BIT_TO_CHANNEL(0x09, 2),
> +	OFFSET_BIT_TO_CHANNEL(0x09, 3),
> +	OFFSET_BIT_TO_CHANNEL(0x0a, 0),
> +	OFFSET_BIT_TO_CHANNEL(0x0a, 1),
> +	OFFSET_BIT_TO_CHANNEL(0x0a, 2),
> +	OFFSET_BIT_TO_CHANNEL(0x0a, 3),
> +	OFFSET_BIT_TO_CHANNEL(0x0a, 4),
> +	OFFSET_BIT_TO_CHANNEL(0x0a, 5),
> +	OFFSET_BIT_TO_CHANNEL(0x0a, 6),
> +	OFFSET_BIT_TO_CHANNEL(0x0b, 0),
> +	OFFSET_BIT_TO_CHANNEL(0x0b, 1),
> +	OFFSET_BIT_TO_CHANNEL(0x0b, 2),
> +	OFFSET_BIT_TO_CHANNEL(0x0b, 3),
> +};
> +
> +static struct platform_device *silicom_platform_dev;
> +static struct led_classdev_mc *silicom_led_info __initdata;
> +static struct gpio_chip *silicom_gpiochip __initdata;
> +static u8 *silicom_gpio_channels __initdata;
> +
> +static int silicom_mec_port_get(unsigned int offset)
> +{
> +	u8 reg;
> +
> +	mutex_lock(&mec_io_mutex);
> +	/* Get the dword offset from the channel */
> +	outb(FIELD_GET(MEC_PREFIX_NAME, offset) & MEC_PORT_OFFSET_MASK, MEC_ADDR);
> +
> +	/* Get the current register */
> +	reg = inb(MEC_DATA_OFFSET(FIELD_GET(MEC_PREFIX_NAME, offset) & MEC_DATA_OFFSET_MASK));
> +	mutex_unlock(&mec_io_mutex);

This is better than before, however, I feel this can be made much cleaner.
E.g., how about this way:

static int silicom_mec_port_get(unsigned int channel)
{
	unsigned int port = FIELD_GET(MEC_CHANNEL_PORT, channel);
	unsigned int reg = FIELD_GET(MEC_CHANNEL_REG, channel);
	u8 val;

	mutex_lock(&mec_io_mutex);
	outb(port << MEC_PORT_SHIFT, MEC_ADDR);
	val = inb(MEC_REG_OFFSET(reg));
	mutex_unlock(&mec_io_mutex);

Note I've rename MEC_DATA_OFFSET() to MEC_REG_OFFSET() and the 
function argument to channel based on how things look at the callers (and 
to match ..._set() variant), I'm not entirely sure if it's better than the 
earlier names.

The usage of terms port, channel, register, data, memory region, and 
offset is currently quite confusing in the code & comments so I've had 
some troubles in following what would be appropriate name for each 
variable so my example above might have additional misnaming because of 
that.

> +
> +	return (reg >> (offset & MEC_PORT_CHANNEL_MASK)) & 0x01;

... FIELD_GET(MEC_PORT_CHANNEL_MASK, offset) ...

I think I mentioned it against some early version, adding _MASK into 
field define names just makes lines longer and provides no additional 
value so I'd just leave them out but it's up to you.

I'm again here lost with the terminology. This function seems to take in 
channel but then this masks channel out of channel? Could the used 
terminology perhaps be cleaned somehow to be more consistent and avoid 
overlaps if there are two things currently which are called "channel".

> +}
> +
> +static enum led_brightness silicom_mec_led_get(int channel)
> +{
> +	/* Outputs are active low */
> +	return silicom_mec_port_get(channel) ? LED_OFF : LED_ON;
> +}
> +
> +static void silicom_mec_port_set(int channel, int on)
> +{
> +	u8 reg;
> +
> +	mutex_lock(&mec_io_mutex);
> +	/* Get the dword offset from the channel */
> +	outb(FIELD_GET(MEC_PREFIX_NAME, channel) & MEC_PORT_OFFSET_MASK, MEC_ADDR);
> +
> +	/* Get the current port settings */
> +	reg = inb(MEC_DATA_OFFSET(FIELD_GET(MEC_PREFIX_NAME, channel) & MEC_DATA_OFFSET_MASK));
> +	/* Outputs are active low, so clear the bit for on, or set it for off */
> +	if (on)
> +		reg &= ~(1 << (channel & MEC_PORT_CHANNEL_MASK));
> +	else
> +		reg |= 1 << (channel & MEC_PORT_CHANNEL_MASK);
> +	/* Write back the updated register */
> +	outb(reg, MEC_DATA_OFFSET(FIELD_GET(MEC_PREFIX_NAME, channel) & MEC_DATA_OFFSET_MASK));
> +	mutex_unlock(&mec_io_mutex);
> +}
> +
> +static enum led_brightness silicom_mec_led_mc_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	enum led_brightness brightness = LED_OFF;
> +	int i;
> +
> +	for (i = 0; i < mc_cdev->num_colors; i++) {
> +		mc_cdev->subled_info[i].brightness =
> +			silicom_mec_led_get(mc_cdev->subled_info[i].channel);
> +		/* Mark the overall brightness as LED_ON if any of the subleds are on */
> +		if (mc_cdev->subled_info[i].brightness != LED_OFF)
> +			brightness = LED_ON;
> +	}
> +
> +	return brightness;
> +}
> +
> +static void silicom_mec_led_mc_brightness_set(struct led_classdev *led_cdev,
> +					      enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	int i;
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +	for (i = 0; i < mc_cdev->num_colors; i++) {
> +		silicom_mec_port_set(mc_cdev->subled_info[i].channel,
> +		mc_cdev->subled_info[i].brightness);
> +	}
> +}
> +
> +static int silicom_gpio_get_direction(struct gpio_chip *gc,
> +				      unsigned int offset)
> +{
> +	u8 *channels = gpiochip_get_data(gc);
> +
> +	/* Input registers have offsets between [0x00, 0x07] */
> +	if (CHANNEL_TO_OFFSET(channels[offset]) < MEC_GPIO_IN_POS)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int silicom_gpio_direction_input(struct gpio_chip *gc,
> +					unsigned int offset)
> +{
> +	int direction = silicom_gpio_get_direction(gc, offset);
> +
> +	return direction == GPIO_LINE_DIRECTION_IN ? 0 : -EINVAL;
> +}
> +
> +static void silicom_gpio_set(struct gpio_chip *gc,
> +			     unsigned int offset,
> +			     int value)
> +{
> +	u8 *channels = gpiochip_get_data(gc);
> +	int direction = silicom_gpio_get_direction(gc, offset);
> +	int channel = channels[offset];
> +
> +	if (direction == GPIO_LINE_DIRECTION_IN)
> +		return;
> +
> +	if (value)
> +		silicom_mec_port_set(channel, 0);
> +	else if (value == 0)
> +		silicom_mec_port_set(channel, 1);
> +	else
> +		pr_err("Wrong argument value: %d\n", value);
> +}
> +
> +static int silicom_gpio_direction_output(struct gpio_chip *gc,
> +					 unsigned int offset,
> +					 int value)
> +{
> +	int direction = silicom_gpio_get_direction(gc, offset);
> +
> +	if (direction == GPIO_LINE_DIRECTION_IN)
> +		return -EINVAL;
> +
> +	silicom_gpio_set(gc, offset, value);
> +
> +	return 0;
> +}
> +
> +static int silicom_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	u8 *channels = gpiochip_get_data(gc);
> +	int channel = channels[offset];
> +
> +	return silicom_mec_port_get(channel);
> +}

> +static struct gpio_chip silicom_gpio_chip = {
> +	.label = "silicom-gpio",
> +	.get_direction = silicom_gpio_get_direction,
> +	.direction_input = silicom_gpio_direction_input,
> +	.direction_output = silicom_gpio_direction_output,
> +	.get = silicom_gpio_get,
> +	.set = silicom_gpio_set,
> +	.base = -1,
> +	.ngpio = ARRAY_SIZE(plat_0222_gpio_channels),
> +	.names = plat_0222_gpio_names,
> +	/* We're using a mutex to protect the indirect access, so we can sleep

/*
 * Start text here for multi-line comments.

> +	 * if the lock blocks
> +	 */
> +	.can_sleep = true,
> +};
> +
> +static struct silicom_platform_info silicom_plat_0222_cordoba_info __initdata = {
> +	.io_base = MEC_IO_BASE,
> +	.io_len = MEC_IO_LEN,
> +	.led_info = plat_0222_mc_led_info,
> +	.gpiochip = &silicom_gpio_chip,
> +	.gpio_channels = plat_0222_gpio_channels,
> +	/* The original generic cordoba does not have the last 4 outputs of the

Ditto.

> +	 * plat_0222 variant, the rest are the same, so use the same longer list,
> +	 * but ignore the last entries here
> +	 */
> +	.ngpio = ARRAY_SIZE(plat_0222_gpio_channels),
> +
> +};

> +/*
> + * sysfs interface
> + */
> +static ssize_t efuse_status_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	u32 reg;
> +
> +	mutex_lock(&mec_io_mutex);
> +	/* Select memory region */
> +	outb(IO_REG_BANK, EC_ADDR_MSB);
> +	outb(MEC_EFUSE_LSB_ADDR, EC_ADDR_LSB);
> +
> +	/* Get current data from the address */
> +	reg = inl(MEC_DATA_OFFSET(DEFAULT_CHAN_LO));
> +	mutex_unlock(&mec_io_mutex);
> +
> +	efuse_status = reg & 0x1;
> +
> +	return sprintf(buf, "%u\n", efuse_status);

sprintf() -> sysfs_emit()

> +}
> +static DEVICE_ATTR_RO(efuse_status);
> +
> +static ssize_t uc_version_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buf)
> +{
> +	u32 reg;
> +	int uc_version;
> +
> +	mutex_lock(&mec_io_mutex);
> +	outb(IO_REG_BANK, EC_ADDR_MSB);
> +	outb(DEFAULT_CHAN_LO, EC_ADDR_LSB);
> +
> +	reg = inl(MEC_DATA_OFFSET(DEFAULT_CHAN_LO));
> +	mutex_unlock(&mec_io_mutex);
> +	uc_version = FIELD_GET(MEC_PREFIX_SEC_BYTE, reg);
> +	if (uc_version >= 192)
> +		return -EINVAL;
> +
> +	uc_version = FIELD_GET(MEC_VERSION_MAJOR, reg) * 100 +
> +		     FIELD_GET(MEC_VERSION_MINOR, reg);
> +
> +	mec_uc_version = uc_version;
> +	return sprintf(buf, "%u\n", mec_uc_version);

sysfs_emit()

> +}
> +static DEVICE_ATTR_RO(uc_version);
> +
> +static ssize_t power_cycle_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	return sprintf(buf, "%u\n", power_cycle);

Ditto.

> +}
> +
> +static void powercycle_uc(void)
> +{
> +	mutex_lock(&mec_io_mutex);
> +	/* Select memory region */
> +	outb(IO_REG_BANK, EC_ADDR_MSB);
> +	outb(MEC_POWER_CYCLE_ADDR, EC_ADDR_LSB);
> +
> +	/* Set to 1 for current data from the address */
> +	outb(1, MEC_DATA_OFFSET(DEFAULT_CHAN_LO));
> +	mutex_unlock(&mec_io_mutex);
> +}
> +
> +static ssize_t power_cycle_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	if (sscanf(buf, "%du", &power_cycle) != 1) {

Shouldn't this be %u 

> +		dev_err(dev, "Failed to read power_cycle\n");

Don't print error here, just return -EINVAL is enough.

> +		return -EINVAL;
> +	}
> +	if (power_cycle > 0)
> +		powercycle_uc();
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(power_cycle);
> +
> +static struct attribute *silicom_attrs[] = {
> +	&dev_attr_efuse_status.attr,
> +	&dev_attr_uc_version.attr,
> +	&dev_attr_power_cycle.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(silicom);
> +
> +static struct platform_driver silicom_platform_driver = {
> +	.driver = {
> +		.name = "silicom-platform",
> +		.dev_groups = silicom_groups,
> +	},
> +};
> +
> +static int __init silicom_mc_leds_register(struct device *dev,
> +					   const struct led_classdev_mc *mc_leds)
> +{
> +	struct led_classdev_mc *led;
> +	int i, err;
> +	int size = sizeof(struct mc_subled);
> +
> +	for (i = 0; mc_leds[i].led_cdev.name; i++) {
> +
> +		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> +		if (!led)
> +			return -ENOMEM;
> +		memcpy(led, &mc_leds[i], sizeof(*led));
> +
> +		led->subled_info = devm_kzalloc(dev, led->num_colors * size, GFP_KERNEL);
> +		if (!led->subled_info)
> +			return -ENOMEM;
> +		memcpy(led->subled_info, mc_leds[i].subled_info, led->num_colors * size);
> +
> +		err = devm_led_classdev_multicolor_register(dev, led);
> +		if (err) {
> +			dev_err(dev, "Failed to register[%d]: %d\n", i, err);

First here you print an error message, then another at the caller. I think 
one error message is enough.

> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 rpm_get(void)
> +{
> +	u32 reg;
> +
> +	mutex_lock(&mec_io_mutex);
> +	/* Select memory region */
> +	outb(IO_REG_BANK, EC_ADDR_MSB);
> +	outb(DEFAULT_CHAN_LO_T, EC_ADDR_LSB);
> +	/* Get current data from the address */
> +	reg = inw(MEC_DATA_OFFSET(DEFAULT_CHAN_LO));
> +	mutex_unlock(&mec_io_mutex);
> +
> +	return reg;
> +}
> +
> +static u32 temp_get(void)
> +{
> +	u32 reg;
> +
> +	mutex_lock(&mec_io_mutex);
> +	/* Select memory region */
> +	outb(IO_REG_BANK, EC_ADDR_MSB);
> +	outb(DEFAULT_CHAN_LO_T, EC_ADDR_LSB);
> +	/* Get current data from the address */
> +	reg = inl(MEC_DATA_OFFSET(DEFAULT_CHAN_LO));
> +	mutex_unlock(&mec_io_mutex);
> +
> +	return FIELD_GET(MEC_PREFIX_HIGH_BYTES, reg) * 100;

It should be something like this:

	return FIELD_GET(MEC_TEMPERATURE, reg) * 100;

> +}
> +
> +static umode_t silicom_fan_control_fan_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_fan_input:
> +	case hwmon_fan_label:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t silicom_fan_control_temp_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_label:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int silicom_fan_control_read_fan(struct device *dev, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		*val = rpm_get();
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int silicom_fan_control_read_temp(struct device *dev, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		*val = temp_get();
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t silicom_fan_control_is_visible(const void *data,
> +					      enum hwmon_sensor_types type,
> +					      u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return silicom_fan_control_fan_is_visible(attr);
> +	case hwmon_temp:
> +		return silicom_fan_control_temp_is_visible(attr);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int silicom_fan_control_read(struct device *dev,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel,
> +				    long *val)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return silicom_fan_control_read_fan(dev, attr, val);
> +	case hwmon_temp:
> +		return silicom_fan_control_read_temp(dev, attr, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int silicom_fan_control_read_labels(struct device *dev,
> +					   enum hwmon_sensor_types type,
> +					   u32 attr, int channel,
> +					   const char **str)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		*str = "Silicom_platfomr: Fan Speed";
> +		return 0;
> +	case hwmon_temp:
> +		*str = "Silicom_platform: Thermostat Sensor";
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops silicom_fan_control_hwmon_ops = {
> +	.is_visible = silicom_fan_control_is_visible,
> +	.read = silicom_fan_control_read,
> +	.read_string = silicom_fan_control_read_labels,
> +};
> +
> +static const struct hwmon_chip_info silicom_chip_info = {
> +	.ops = &silicom_fan_control_hwmon_ops,
> +	.info = silicom_fan_control_info,
> +};
> +
> +static int __init silicom_platform_probe(struct platform_device *device)
> +{
> +	int err;
> +	u8 magic, ver;
> +	struct device *hwmon_dev;
> +	const char *name = "Silocom_Fan_Monitor";
> +
> +	if (!devm_request_region(&device->dev, MEC_IO_BASE, MEC_IO_LEN, "mec")) {
> +		dev_err(&device->dev, "couldn't reserve MEC io ports\n");
> +		return -EBUSY;
> +	}
> +
> +	/* Sanity check magic number read for EC */
> +	outb(IO_REG_BANK, MEC_ADDR);
> +	magic = inb(MEC_DATA_OFFSET(DEFAULT_CHAN_LO));
> +	ver = inb(MEC_DATA_OFFSET(DEFAULT_CHAN_HI));
> +	dev_dbg(&device->dev, "EC magic 0x%02x, version 0x%02x\n", magic, ver);
> +
> +	if (magic != SILICOM_MEC_MAGIC) {
> +		dev_err(&device->dev, "Bad EC magic 0x%02x!\n", magic);
> +		return -ENODEV;
> +	}
> +
> +	err = silicom_mc_leds_register(&device->dev, silicom_led_info);
> +	if (err) {
> +		dev_err(&device->dev, "Failed to register LEDs\n");
> +		return err;
> +	}
> +
> +	err = devm_gpiochip_add_data(&device->dev, silicom_gpiochip,
> +				     silicom_gpio_channels);
> +	if (err) {
> +		dev_err(&device->dev, "Failed to register gpiochip: %d\n", err);
> +		return err;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&device->dev, name, NULL,
> +							 &silicom_chip_info, NULL);
> +	err = PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (err) {
> +		dev_err(&device->dev, "Failed to register hwmon_dev: %d\n", err);
> +		return err;
> +	}
> +
> +	return err;
> +}
> +
> +static int __init silicom_platform_info_init(const struct dmi_system_id *id)
> +{
> +	struct silicom_platform_info *info = id->driver_data;
> +
> +	pr_info("Silicom Platform: Detected %s\n", id->ident);

Printing something during init that goes okay is not something we do 
anymore.

> +	silicom_led_info = info->led_info;
> +	silicom_gpio_channels = info->gpio_channels;
> +	silicom_gpiochip = info->gpiochip;
> +	silicom_gpiochip->ngpio = info->ngpio;
> +
> +	return 1;
> +}


-- 
 i.
--8323329-1420067774-1698064437=:1721--
