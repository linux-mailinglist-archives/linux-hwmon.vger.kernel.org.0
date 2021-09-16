Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3827340EBF8
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Sep 2021 23:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240010AbhIPVMQ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 16 Sep 2021 17:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbhIPVMP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 17:12:15 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90B8C061574;
        Thu, 16 Sep 2021 14:10:54 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w19so10907426oik.10;
        Thu, 16 Sep 2021 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S3LXZjn0yHbZYvXAZd5BuQyX9uMBC5PsxX5hy/aoPRg=;
        b=lDubgJiJQcDHn/T7x+lfrUtKDM4c1IPIAUL3suVWtR2jLvsojg0x+6hYBws2z4S7ck
         PlG5QJMACLhQonB9v8kXzOxop8IwUbt6zgv2wbNk1FIjXiKq/nx6mQQ/svkyPSY/ggjM
         5xTGU+wuoDqz3B/VIuHBF6AHKgXUMXeDT0Ox5GSEI0gyNXIBYhCmxmC8iehzr4nOGI5R
         MJ2Cvb+mIX8wor/mcLsrXM1cGPqCb5WgY00SUXuDBsPWIbk5FOb93SdGnx8+slPlFm9b
         tAnwhwtjTCXpOf3bj7BN4xBOF6qhJMHxBWRKRkZTrBteyYnXVi4pe/68yzUI3w82txDJ
         8r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S3LXZjn0yHbZYvXAZd5BuQyX9uMBC5PsxX5hy/aoPRg=;
        b=Xysy20GLQDM5r4mfQZQOgB5K6R4KVAAsQKT6R3TsYVpmBPTn6lMix8No55i0mcjQue
         D9N3ZKtt2lmmPFPNU7J5EdOfzEk8bbiY1X9T4fFhCURL2xO3r/rk4Pd95hhD15OT9hMq
         UTTSkK9UaYX2aVxtaVi99L8qMYtU3AQSgv3AzDcKgVTaEKtSnPhnQ2NJVBxD6d5gokKr
         qy/pmcjuwbcXykNwXZzrESmwYIfeHZr04etnh+SVmWrZIQORSAnLe7ceXITzwW8fhKgh
         D9z0PaDcg2klT/g6U1PRj0RsCjBkrUB5SosHw/TV16bzOYqRYrsy+bLhiqDb5w35EyuZ
         Lhyw==
X-Gm-Message-State: AOAM532TfqzHrmmRkXjJgkMH/ystIpsr49gBVV+j8qg4OrD9H5TcMVJO
        yJ/I1Mnbn2tlgV8rYUzftyfCHTn1isg=
X-Google-Smtp-Source: ABdhPJyzR6u1kbeZZI31tvEjvn4Z4+LPJ+EWM8E9V4ss80cWjloYUMlZ0b5imO1henFQQ619y3q8mA==
X-Received: by 2002:a05:6808:b21:: with SMTP id t1mr10792156oij.165.1631826652672;
        Thu, 16 Sep 2021 14:10:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m24sm977029oie.50.2021.09.16.14.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 14:10:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v7 3/3] hwmon: (nct6775) Support access via Asus WMI
To:     Denis Pauk <pauk.denis@gmail.com>
Cc:     Bernhard Seibold <mail@bernhard-seibold.de>,
        =?UTF-8?Q?P=c3=a4r_Ekholm?= <pehlm@pekholm.org>,
        to.eivind@gmail.com, "Artem S . Tashkinov" <aros@gmx.com>,
        Vittorio Roberto Alfieri <me@rebtoor.com>,
        Sahan Fernando <sahan.h.fernando@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210916202233.40334-1-pauk.denis@gmail.com>
 <20210916202233.40334-5-pauk.denis@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <78a08749-5094-b7a6-1672-6087f33c62e3@roeck-us.net>
Date:   Thu, 16 Sep 2021 14:10:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916202233.40334-5-pauk.denis@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/21 1:22 PM, Denis Pauk wrote:
> Support accessing the NCT677x via Asus WMI functions.
> 
> On mainboards that support this way of accessing the chip, the driver will
> usually not work without this option since in these mainboards, ACPI will
> mark the I/O port as used.
> 
> Code uses ACPI firmware interface to communicate with sensors with ASUS
> motherboards:
> * PRIME B460-PLUS,
> * ROG CROSSHAIR VIII IMPACT,
> * ROG STRIX B550-E GAMING,
> * ROG STRIX B550-F GAMING,
> * ROG STRIX B550-F GAMING (WI-FI),
> * ROG STRIX Z490-I GAMING,
> * TUF GAMING B550M-PLUS,
> * TUF GAMING B550M-PLUS (WI-FI),
> * TUF GAMING B550-PLUS,
> * TUF GAMING X570-PLUS,
> * TUF GAMING X570-PRO (WI-FI).
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204807
> Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
> Co-developed-by: Bernhard Seibold <mail@bernhard-seibold.de>
> Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
> Tested-by: Pär Ekholm <pehlm@pekholm.org>
> Tested-by: <to.eivind@gmail.com>
> Tested-by: Artem S. Tashkinov <aros@gmx.com>
> Tested-by: Vittorio Roberto Alfieri <me@rebtoor.com>
> Tested-by: Sahan Fernando <sahan.h.fernando@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> 
> ---
> Changes in v7:
>    - Remove unrequred & 0xff with int8 variables.
>    - Make ASUSWMI_UNSUPPORTED_METHOD as default value for WMI responce,
>      before run wmi_evaluate_method().
>    - Rename ASUSWMI_MGMT2_GUID to ASUSWMI_MONITORING_GUID.
>    - Replace checks of 'err != -EINVAL' with 'err >= 0' for match_string result.
> 
> Changes in v6:
>    - Minimaze codes inside code inside defined(CONFIG_ACPI_WMI).
> 
> Changes in v5:
>    - Use IS_ENABLED(CONFIG_ACPI_WMI) instead defined(CONFIG_ACPI_WMI)
> 
> Changes in v4:
>    - Fix build without ACPI WMI.
> 
> Changes in v3:
>    - Remove unrequired type conversions.
>    - Save result of match_string before check.
> 
> Changes in v2:
>    - Split changes to separate patches.
>    - Limit WMI usage by DMI_BOARD_NAME in checked ASUS motherboards.
> ---
>   drivers/hwmon/Kconfig   |   1 +
>   drivers/hwmon/nct6775.c | 230 ++++++++++++++++++++++++++++++++++++----
>   2 files changed, 210 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e3675377bc5d..9eefb1014b53 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1423,6 +1423,7 @@ config SENSORS_NCT6683
>   config SENSORS_NCT6775
>   	tristate "Nuvoton NCT6775F and compatibles"
>   	depends on !PPC
> +	depends on ACPI_WMI || ACPI_WMI=n
>   	select HWMON_VID
>   	help
>   	  If you say yes here you get support for the hardware monitoring
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index 4253eed7f5b0..46262d9d3bd9 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -55,6 +55,7 @@
>   #include <linux/dmi.h>
>   #include <linux/io.h>
>   #include <linux/nospec.h>
> +#include <linux/wmi.h>
>   #include "lm75.h"
>   
>   #define USE_ALTERNATE
> @@ -132,10 +133,13 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
>   #define SIO_ID_MASK		0xFFF8
>   
>   enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
> +enum sensor_access { access_direct, access_asuswmi };
>   
>   struct nct6775_sio_data {
>   	int sioreg;
> +	int ld;
>   	enum kinds kind;
> +	enum sensor_access access;
>   
>   	/* superio_() callbacks  */
>   	void (*sio_outb)(struct nct6775_sio_data *sio_data, int reg, int val);
> @@ -145,6 +149,90 @@ struct nct6775_sio_data {
>   	void (*sio_exit)(struct nct6775_sio_data *sio_data);
>   };
>   
> +#define ASUSWMI_MONITORING_GUID		"466747A0-70EC-11DE-8A39-0800200C9A66"
> +#define ASUSWMI_METHODID_RSIO		0x5253494F
> +#define ASUSWMI_METHODID_WSIO		0x5753494F
> +#define ASUSWMI_METHODID_RHWM		0x5248574D
> +#define ASUSWMI_METHODID_WHWM		0x5748574D
> +#define ASUSWMI_UNSUPPORTED_METHOD	0xFFFFFFFE
> +
> +static int asuswmi_evaluate_method(u32 method_id, u8 bank, u8 reg, u8 val, u32 *retval)
> +{
> +#if IS_ENABLED(CONFIG_ACPI_WMI)
> +	u32 args = bank | (reg << 8) | (val << 16);
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	union acpi_object *obj;
> +	u32 tmp = ASUSWMI_UNSUPPORTED_METHOD;
> +
> +	status = wmi_evaluate_method(ASUSWMI_MONITORING_GUID, 0,
> +				     method_id, &input, &output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (obj && obj->type == ACPI_TYPE_INTEGER)
> +		tmp = obj->integer.value;
> +
> +	if (retval)
> +		*retval = tmp;
> +
> +	kfree(obj);
> +
> +	if (tmp == ASUSWMI_UNSUPPORTED_METHOD)
> +		return -ENODEV;
> +	return 0;
> +#else
> +	return -EOPNOTSUPP;
> +#endif
> +}
> +
> +static inline int nct6775_asuswmi_write(u8 bank, u8 reg, u8 val)
> +{
> +	return asuswmi_evaluate_method(ASUSWMI_METHODID_WHWM, bank,
> +							      reg, val, NULL);
> +}
> +
> +static inline int nct6775_asuswmi_read(u8 bank, u8 reg, u8 *val)
> +{
> +	u32 tmp = 0;
> +	int ret = asuswmi_evaluate_method(ASUSWMI_METHODID_RHWM, bank,
> +				     reg, 0, &tmp);
> +	*val = tmp;
> +	return ret;
> +}
> +
> +static int superio_wmi_inb(struct nct6775_sio_data *sio_data, int reg)
> +{
> +	int tmp;
> +
> +	asuswmi_evaluate_method(ASUSWMI_METHODID_RSIO, sio_data->ld,
> +				reg, 0, &tmp);
> +	return tmp;
> +}
> +
> +static void superio_wmi_outb(struct nct6775_sio_data *sio_data, int reg, int val)
> +{
> +	asuswmi_evaluate_method(ASUSWMI_METHODID_WSIO, sio_data->ld,
> +				reg, val, NULL);
> +}
> +
> +static void superio_wmi_select(struct nct6775_sio_data *sio_data, int ld)
> +{
> +	sio_data->ld = ld;
> +}
> +
> +static int superio_wmi_enter(struct nct6775_sio_data *sio_data)
> +{
> +	return 0;
> +}
> +
> +static void superio_wmi_exit(struct nct6775_sio_data *sio_data)
> +{
> +}
> +
>   static void superio_outb(struct nct6775_sio_data *sio_data, int reg, int val)
>   {
>   	int ioreg = sio_data->sioreg;
> @@ -207,6 +295,7 @@ static void superio_exit(struct nct6775_sio_data *sio_data)
>   
>   #define NCT6775_REG_BANK	0x4E
>   #define NCT6775_REG_CONFIG	0x40
> +#define NCT6775_PORT_CHIPID	0x58
>   
>   /*
>    * Not currently used:
> @@ -1423,6 +1512,45 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
>   	return false;
>   }
>   
> +static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
> +{
> +	u8 bank = reg >> 8;
> +
> +	data->bank = bank;
> +}
> +
> +static u16 nct6775_wmi_read_value(struct nct6775_data *data, u16 reg)
> +{
> +	int res, word_sized = is_word_sized(data, reg);
> +	u8 tmp;
> +
> +	nct6775_wmi_set_bank(data, reg);
> +
> +	nct6775_asuswmi_read(data->bank, reg, &tmp);
> +	res = tmp;
> +	if (word_sized) {
> +		nct6775_asuswmi_read(data->bank, (reg & 0xff) + 1, &tmp);

I just realized that all error returns from the wmi access methods are ignored.
Why ?

> +		res = (res << 8) + tmp;
> +	}
> +	return res;
> +}
> +
> +static int nct6775_wmi_write_value(struct nct6775_data *data, u16 reg, u16 value)
> +{
> +	int word_sized = is_word_sized(data, reg);
> +
> +	nct6775_wmi_set_bank(data, reg);
> +
> +	if (word_sized) {
> +		nct6775_asuswmi_write(data->bank, reg & 0xff, value >> 8);
> +		nct6775_asuswmi_write(data->bank, (reg & 0xff) + 1, value);
> +	} else {
> +		nct6775_asuswmi_write(data->bank, reg & 0xff, value);
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * On older chips, only registers 0x50-0x5f are banked.
>    * On more recent chips, all registers are banked.
> @@ -3818,10 +3946,12 @@ static int nct6775_probe(struct platform_device *pdev)
>   	struct device *hwmon_dev;
>   	int num_attr_groups = 0;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> -	if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
> -				 DRVNAME))
> -		return -EBUSY;
> +	if (sio_data->access == access_direct) {
> +		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +		if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
> +					 DRVNAME))
> +			return -EBUSY;
> +	}
>   
>   	data = devm_kzalloc(&pdev->dev, sizeof(struct nct6775_data),
>   			    GFP_KERNEL);
> @@ -3830,9 +3960,16 @@ static int nct6775_probe(struct platform_device *pdev)
>   
>   	data->kind = sio_data->kind;
>   	data->sioreg = sio_data->sioreg;
> -	data->addr = res->start;
> -	data->read_value = nct6775_read_value;
> -	data->write_value = nct6775_write_value;
> +
> +	if (sio_data->access == access_direct) {
> +		data->addr = res->start;
> +		data->read_value = nct6775_read_value;
> +		data->write_value = nct6775_write_value;
> +	} else {
> +		data->read_value = nct6775_wmi_read_value;
> +		data->write_value = nct6775_wmi_write_value;
> +	}
> +
>   	mutex_init(&data->update_lock);
>   	data->name = nct6775_device_names[data->kind];
>   	data->bank = 0xff;		/* Force initial bank selection */
> @@ -4743,6 +4880,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
>   	int err;
>   	int addr;
>   
> +	sio_data->access = access_direct;
>   	sio_data->sioreg = sioaddr;
>   
>   	err = sio_data->sio_enter(sio_data);
> @@ -4837,6 +4975,23 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
>    */
>   static struct platform_device *pdev[2];
>   
> +static const char * const asus_wmi_boards[] = {
> +	"PRIME B460-PLUS",
> +	"ROG CROSSHAIR VIII DARK HERO",
> +	"ROG CROSSHAIR VIII HERO",
> +	"ROG CROSSHAIR VIII IMPACT",
> +	"ROG STRIX B550-E GAMING",
> +	"ROG STRIX B550-F GAMING",
> +	"ROG STRIX B550-F GAMING (WI-FI)",
> +	"ROG STRIX Z490-I GAMING",
> +	"TUF GAMING B550M-PLUS",
> +	"TUF GAMING B550M-PLUS (WI-FI)",
> +	"TUF GAMING B550-PLUS",
> +	"TUF GAMING X570-PLUS",
> +	"TUF GAMING X570-PLUS (WI-FI)",
> +	"TUF GAMING X570-PRO (WI-FI)",
> +};
> +
>   static int __init sensors_nct6775_init(void)
>   {
>   	int i, err;
> @@ -4845,11 +5000,32 @@ static int __init sensors_nct6775_init(void)
>   	struct resource res;
>   	struct nct6775_sio_data sio_data;
>   	int sioaddr[2] = { 0x2e, 0x4e };
> +	enum sensor_access access = access_direct;
> +	const char *board_vendor, *board_name;
> +	u8 tmp;
>   
>   	err = platform_driver_register(&nct6775_driver);
>   	if (err)
>   		return err;
>   
> +	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (board_name && board_vendor &&
> +	    !strcmp(board_vendor, "ASUSTeK COMPUTER INC.")) {
> +		err = match_string(asus_wmi_boards, ARRAY_SIZE(asus_wmi_boards),
> +				   board_name);
> +		if (err >= 0) {
> +			/* if reading chip id via WMI succeeds, use WMI */
> +			if (!nct6775_asuswmi_read(0, NCT6775_PORT_CHIPID, &tmp)) {
> +				pr_info("Using Asus WMI to access %#x chip.\n", tmp);
> +				access = access_asuswmi;
> +			} else {
> +				pr_err("Can't read ChipID by Asus WMI.\n");
> +			}
> +		}
> +	}
> +
>   	/*
>   	 * initialize sio_data->kind and sio_data->sioreg.
>   	 *
> @@ -4870,6 +5046,16 @@ static int __init sensors_nct6775_init(void)
>   
>   		found = true;
>   
> +		sio_data.access = access;
> +
> +		if (access == access_asuswmi) {
> +			sio_data.sio_outb = superio_wmi_outb;
> +			sio_data.sio_inb = superio_wmi_inb;
> +			sio_data.sio_select = superio_wmi_select;
> +			sio_data.sio_enter = superio_wmi_enter;
> +			sio_data.sio_exit = superio_wmi_exit;
> +		}
> +
>   		pdev[i] = platform_device_alloc(DRVNAME, address);
>   		if (!pdev[i]) {
>   			err = -ENOMEM;
> @@ -4881,23 +5067,25 @@ static int __init sensors_nct6775_init(void)
>   		if (err)
>   			goto exit_device_put;
>   
> -		memset(&res, 0, sizeof(res));
> -		res.name = DRVNAME;
> -		res.start = address + IOREGION_OFFSET;
> -		res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
> -		res.flags = IORESOURCE_IO;
> +		if (sio_data.access == access_direct) {
> +			memset(&res, 0, sizeof(res));
> +			res.name = DRVNAME;
> +			res.start = address + IOREGION_OFFSET;
> +			res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
> +			res.flags = IORESOURCE_IO;
> +
> +			err = acpi_check_resource_conflict(&res);
> +			if (err) {
> +				platform_device_put(pdev[i]);
> +				pdev[i] = NULL;
> +				continue;
> +			}
>   
> -		err = acpi_check_resource_conflict(&res);
> -		if (err) {
> -			platform_device_put(pdev[i]);
> -			pdev[i] = NULL;
> -			continue;
> +			err = platform_device_add_resources(pdev[i], &res, 1);
> +			if (err)
> +				goto exit_device_put;
>   		}
>   
> -		err = platform_device_add_resources(pdev[i], &res, 1);
> -		if (err)
> -			goto exit_device_put;
> -
>   		/* platform_device_add calls probe() */
>   		err = platform_device_add(pdev[i]);
>   		if (err)
> 

