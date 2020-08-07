Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AE623F01C
	for <lists+linux-hwmon@lfdr.de>; Fri,  7 Aug 2020 17:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgHGPmd (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 7 Aug 2020 11:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgHGPmd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Aug 2020 11:42:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BC8C061756;
        Fri,  7 Aug 2020 08:42:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id d4so1074106pjx.5;
        Fri, 07 Aug 2020 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=KiuVvN3hd/iXZ6gwoMDheqix6K9njz15cTA3H6BAdyE=;
        b=nDPbdfAGhpUe13/Z/2YJHfpY9vyngUZ7jJ1nGT3cker/oVfuIvzeoFRMQGQdJuB+9L
         SkjNE5/RazYozBcHfzJkDYtkugt6COQOi1lWuGDkYT9ojlRlrBvbD4rmVz5dsbeeonm+
         Megcq7cJyy7QfbIUTZWn4nC/nCPteMpeuC5qorjLfsRybcEf2gZQg0orIpJNFhPwG3Vp
         l77DNKMQPSQ/7jUPIA8PzyYyRlGwh7dWLXbjbPNkxUhQVwlvIEjkJBZWUgPPTVaiH/rP
         HQLZAvDO9mOzcDLOOu4umYpI2lHddNUMDB3IvxhGdJTRAb9xil9U5QxmlE2GFeNSNRGZ
         vfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=KiuVvN3hd/iXZ6gwoMDheqix6K9njz15cTA3H6BAdyE=;
        b=Ga+OIf/SGEnxfEZ19clSeHSwK0mfYrZl83OpRUCMfif+JtxGbKWPOIhq8zXCi0wPf6
         aw9pAIfhlpu5D9ZTJmfX0cFsbwZYxCRytgpoyaTBVJ42fYZl5EKSZGOsugwd/tP6wgH8
         F3fRu2XTtfoL87QtuePeHh1cNPpXkMBtTGZnGXLwNDSumX1Cyoe2sZ9TdGVC1rlGAwkO
         NoQEDz3M5UJN+GKjH3Luzz7lpFzKE1/e0AoW7DRyPbihD0WjiyA1OwvQ/AtAJkIbKPue
         FRJzYUCxFOWCEPsNX1+nHbjyZ5NkincnOFhNvHGYi0yNcMsPN0gM9EU40LKmrlakeU8N
         glhw==
X-Gm-Message-State: AOAM531Cc2MQRee/h/xLXvglQ3fHt+5YVeaFFeZspDNEUaxI6gdWUpGr
        G3G1GKp51Q5yhQI4m8dVsNY=
X-Google-Smtp-Source: ABdhPJxPRaZtfxWMskSse9NahnS8u0sxE3/p43F4QQnMen4HeziMrI+JMmf6idXxxLf5NIU4a9cCUg==
X-Received: by 2002:a17:90a:1089:: with SMTP id c9mr14246652pja.180.1596814952776;
        Fri, 07 Aug 2020 08:42:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id na14sm10988152pjb.6.2020.08.07.08.42.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 08:42:32 -0700 (PDT)
Date:   Fri, 7 Aug 2020 08:42:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     alexandru.tachici@analog.com
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v7 7/9] hwmon: pmbus: adm1266: program firmware
Message-ID: <20200807154231.GA39293@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 27, 2020 at 07:19:26PM +0300, alexandru.tachici@analog.com wrote:
> From: Alexandru Tachici <alexandru.tachici@analog.com>
> 
> Writing the firmware Intel hex file to the nvmem,
> of the master adm1266,  with offset 0, will now
> trigger the firmware programming of all cascaded
> devices simultaneously through pmbus.
> 
> During this process all adm1266 sequencers will be
> stopped and at the end will be issued a hard reset
> (see AN-1453 Programming the firmware).
> 

I _really_ don't want to have this as part of the driver.
This should be done from userspace, using a script or program
and i2c-dev, in a controlled environment.

Thanks,
Guenter

> Signed-off-by: Alexandru Tachici <alexandru.tachici@analog.com>
> ---
>  drivers/hwmon/pmbus/adm1266.c | 501 +++++++++++++++++++++++++++++++++-
>  1 file changed, 500 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index f571fe1ee35d..f851c6617870 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/crc8.h>
>  #include <linux/debugfs.h>
> +#include <linux/delay.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-smbus.h>
> @@ -18,18 +19,31 @@
>  #include <linux/nvmem-consumer.h>
>  #include <linux/nvmem-provider.h>
>  #include "pmbus.h"
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/timekeeping.h>
>  
> +#define ADM1266_STORE_USER_ALL	0x15
> +#define ADM1266_STATUS_MFR	0x80
> +#define ADM1266_IC_DEVICE_REV	0xAE
>  #define ADM1266_BLACKBOX_CONFIG	0xD3
>  #define ADM1266_PDIO_CONFIG	0xD4
> +#define ADM1266_SEQUENCE_CONFIG	0xD6
> +#define ADM1266_SYSTEM_CONFIG	0xD7
> +#define ADM1266_GO_COMMAND	0xD8
>  #define ADM1266_READ_STATE	0xD9
>  #define ADM1266_READ_BLACKBOX	0xDE
>  #define ADM1266_SET_RTC		0xDF
> +#define ADM1266_LOGIC_CONFIG	0xE0
>  #define ADM1266_GPIO_CONFIG	0xE1
> +#define ADM1266_USER_DATA	0xE3
>  #define ADM1266_BLACKBOX_INFO	0xE6
>  #define ADM1266_PDIO_STATUS	0xE9
>  #define ADM1266_GPIO_STATUS	0xEA
> +#define ADM1266_MEMORY_CONFIG	0xF8
> +#define ADM1266_SWITCH_MEMORY	0xFA
> +#define ADM1266_UPDATE_FW	0xFC
> +#define ADM1266_FW_PASSWORD	0xFD
>  
>  /* ADM1266 GPIO defines */
>  #define ADM1266_GPIO_NR			9
> @@ -44,10 +58,35 @@
>  #define ADM1266_PDIO_GLITCH_FILT(x)	FIELD_GET(GENMASK(12, 9), x)
>  #define ADM1266_PDIO_OUT_CFG(x)		FIELD_GET(GENMASK(2, 0), x)
>  
> +/* ADM1266 FW_PASSWORD defines*/
> +#define ADM1266_PASSWD_CMD_LEN	17
> +#define ADM1266_CHANGE_PASSWORD	1
> +#define ADM1266_UNLOCK_DEV	2
> +#define ADM1266_LOCK_DEV	3
> +
> +/* ADM1266 STATUS_MFR defines */
> +#define ADM1266_STATUS_PART_LOCKED(x)	FIELD_GET(BIT(2), x)
> +
> +/* ADM1266 GO_COMMAND defines */
> +#define ADM1266_GO_COMMAND_STOP		BIT(0)
> +#define ADM1266_GO_COMMAND_SEQ_RES	BIT(1)
> +#define ADM1266_GO_COMMAND_HARD_RES	BIT(2)
> +
> +#define ADM1266_FIRMWARE_OFFSET		0x00000
> +#define ADM1266_FIRMWARE_SIZE		131072
>  #define ADM1266_BLACKBOX_OFFSET		0x7F700
>  #define ADM1266_BLACKBOX_SIZE		64
>  
>  #define ADM1266_PMBUS_BLOCK_MAX		255
> +#define ADM1266_MAX_DEVICES		16
> +
> +static LIST_HEAD(registered_masters);
> +static DEFINE_MUTEX(registered_masters_lock);
> +
> +struct adm1266_data_ref {
> +	struct adm1266_data *data;
> +	struct list_head list;
> +};
>  
>  struct adm1266_data {
>  	struct pmbus_driver_info info;
> @@ -57,6 +96,10 @@ struct adm1266_data {
>  	struct dentry *debugfs_dir;
>  	struct nvmem_config nvmem_config;
>  	struct nvmem_device *nvmem;
> +	bool master_dev;
> +	struct list_head cascaded_devices_list;
> +	struct mutex cascaded_devices_mutex; /* lock cascaded_devices_list */
> +	u8 nr_devices;
>  	u8 *dev_mem;
>  	struct mutex buf_mutex;
>  	u8 write_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
> @@ -69,6 +112,11 @@ static const struct nvmem_cell_info adm1266_nvmem_cells[] = {
>  		.offset         = ADM1266_BLACKBOX_OFFSET,
>  		.bytes          = 2048,
>  	},
> +	{
> +		.name           = "firmware",
> +		.offset         = ADM1266_FIRMWARE_OFFSET,
> +		.bytes          = ADM1266_FIRMWARE_SIZE,
> +	},
>  };
>  
>  DECLARE_CRC8_TABLE(pmbus_crc_table);
> @@ -123,6 +171,27 @@ static int adm1266_pmbus_group_command(struct adm1266_data *data, struct i2c_cli
>  	return ret;
>  }
>  
> +static int adm1266_group_cmd(struct adm1266_data *data, u8 cmd, u8 *write_data, u8 w_len,
> +			     bool to_slaves)
> +{
> +	struct i2c_client *clients[ADM1266_MAX_DEVICES];
> +	struct adm1266_data_ref *slave_ref;
> +	int i = 0;
> +
> +	clients[i] = data->client;
> +	i++;
> +
> +	if (!to_slaves)
> +		return adm1266_pmbus_group_command(data, clients, 1, cmd, w_len, write_data);
> +
> +	list_for_each_entry(slave_ref, &data->cascaded_devices_list, list) {
> +		clients[i] = slave_ref->data->client;
> +		i++;
> +	}
> +
> +	return adm1266_pmbus_group_command(data, clients, i, cmd, w_len, write_data);
> +}
> +
>  /*
>   * Different from Block Read as it sends data and waits for the slave to
>   * return a value dependent on that data. The protocol is simply a Write Block
> @@ -448,6 +517,9 @@ static int adm1266_read_mem_cell(struct adm1266_data *data, const struct nvmem_c
>  		if (ret)
>  			dev_err(&data->client->dev, "Could not read blackbox!");
>  		return ret;
> +	case ADM1266_FIRMWARE_OFFSET:
> +		/* firmware is write-only */
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -476,14 +548,411 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val,
>  	return 0;
>  }
>  
> +static int adm1266_unlock_device(struct adm1266_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	u8 passwd_cmd[ADM1266_PASSWD_CMD_LEN];
> +	int reg_val;
> +	int ret;
> +	int i;
> +
> +	memset(passwd_cmd, 0xFF, ADM1266_PASSWD_CMD_LEN);
> +	passwd_cmd[ADM1266_PASSWD_CMD_LEN - 1] = ADM1266_UNLOCK_DEV;
> +
> +	/* password needs to be written twice correctly*/
> +	for (i = 0; i < 2; i++) {
> +		ret = i2c_smbus_write_block_data(client, ADM1266_FW_PASSWORD,
> +						 ADM1266_PASSWD_CMD_LEN, passwd_cmd);
> +		if (ret < 0) {
> +			dev_err(&client->dev, "Could not write password.");
> +			return ret;
> +		}
> +
> +		/* 50 ms delay between subsequent password writes are needed*/
> +		msleep(50);
> +	}
> +
> +	/* check if device is unlocked */
> +	reg_val = pmbus_read_byte_data(client, 0, ADM1266_STATUS_MFR);
> +	if (reg_val < 0) {
> +		dev_err(&client->dev, "Could not read status.");
> +		return reg_val;
> +	}
> +	if (ADM1266_STATUS_PART_LOCKED(reg_val)) {
> +		dev_err(&client->dev, "Device locked.");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int adm1266_unlock_all_dev(struct adm1266_data *data)
> +{
> +	struct adm1266_data_ref *slave_ref;
> +	int ret;
> +
> +	ret = adm1266_unlock_device(data);
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "Could not unlock master.");
> +		return ret;
> +	}
> +
> +	list_for_each_entry(slave_ref, &data->cascaded_devices_list, list) {
> +		ret = adm1266_unlock_device(slave_ref->data);
> +		if (ret < 0) {
> +			dev_err(&data->client->dev, "Could not unlock slave addr: %d.",
> +				slave_ref->data->client->addr);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int adm1266_lock_device(struct adm1266_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	u8 passwd_cmd[ADM1266_PASSWD_CMD_LEN];
> +	int reg_val;
> +	int ret;
> +
> +	memset(passwd_cmd, 0, ADM1266_PASSWD_CMD_LEN);
> +	passwd_cmd[ADM1266_PASSWD_CMD_LEN - 1] = ADM1266_LOCK_DEV;
> +
> +	ret = i2c_smbus_write_block_data(client, ADM1266_FW_PASSWORD, ADM1266_PASSWD_CMD_LEN,
> +					 passwd_cmd);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(50);
> +
> +	/* check if device is now locked */
> +	reg_val = pmbus_read_byte_data(client, 0, ADM1266_STATUS_MFR);
> +	if (reg_val < 0)
> +		return reg_val;
> +
> +	if (!ADM1266_STATUS_PART_LOCKED(reg_val))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +static void adm1266_lock_all_dev(struct adm1266_data *data)
> +{
> +	struct adm1266_data_ref *slave_ref;
> +	int ret;
> +
> +	ret = adm1266_lock_device(data);
> +	if (ret < 0)
> +		dev_warn(&data->client->dev, "Could not lock dev: %s.",
> +			 dev_name(&data->client->dev));
> +
> +	list_for_each_entry(slave_ref, &data->cascaded_devices_list, list) {
> +		ret = adm1266_lock_device(slave_ref->data);
> +		if (ret < 0)
> +			dev_warn(&slave_ref->data->client->dev, "Could not lock dev: %s.",
> +				 dev_name(&slave_ref->data->client->dev));
> +	}
> +}
> +
> +static const int write_delays[][3] = {
> +	{ADM1266_SYSTEM_CONFIG, 400, 1},
> +	{ADM1266_USER_DATA, 100, 1},
> +	{ADM1266_LOGIC_CONFIG, 200, 1},
> +	{ADM1266_SEQUENCE_CONFIG, 2500, 1},
> +	{ADM1266_UPDATE_FW, 2000, 1},
> +	{ADM1266_MEMORY_CONFIG, 100, 0},
> +	{ADM1266_STORE_USER_ALL, 300, 0},
> +};
> +
> +static int adm1266_write_hex(struct adm1266_data *data,
> +			     unsigned int offset, unsigned int size)
> +{
> +	const u8 *ending_str = ":00000001FF";
> +	u8 *hex_cmd = data->dev_mem + offset;
> +	u8 *fw_end = data->dev_mem + offset + size;
> +	unsigned int write_delay;
> +	u8 write_buf[ADM1266_PMBUS_BLOCK_MAX + 1];
> +	u8 first_writes[7];
> +	u8 byte_count;
> +	u8 reg_address;
> +	int ret;
> +	int i;
> +
> +	memset(first_writes, 1, 7);
> +
> +	while (hex_cmd < fw_end) {
> +		hex_cmd = strnchr(hex_cmd, size, ':');
> +
> +		if (!hex_cmd || hex_cmd >= fw_end) {
> +			dev_err(&data->client->dev, "Firmware ending missing.");
> +			return -EINVAL;
> +		}
> +
> +		if (!strncmp(hex_cmd, ending_str, strlen(ending_str)))
> +			break;
> +
> +		hex_cmd++;
> +
> +		ret = hex2bin(&byte_count, hex_cmd, 1);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = hex2bin(&reg_address, hex_cmd + 4, 1);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = hex2bin(write_buf, hex_cmd + 8, byte_count);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = adm1266_group_cmd(data, reg_address, write_buf, byte_count, true);
> +		if (ret < 0) {
> +			dev_err(&data->client->dev, "Firmware write error: %d.", ret);
> +			return ret;
> +		}
> +
> +		/* write to eeprom with specified delays */
> +		write_delay = 40;
> +		for (i = 0; i < 7; i++) {
> +			if (reg_address == write_delays[i][0]) {
> +				if (write_delays[i][2] && first_writes[i]) {
> +					first_writes[i] = 0;
> +					write_delay = write_delays[i][1];
> +				}
> +
> +				if (!write_delays[i][2])
> +					write_delay = write_delays[i][1];
> +			}
> +		}
> +		msleep(write_delay);
> +	}
> +
> +	return 0;
> +}
> +
> +static int adm1266_program_firmware(struct adm1266_data *data)
> +{
> +	u8 write_data[3];
> +	int ret;
> +
> +	write_data[0] = ADM1266_GO_COMMAND_STOP | ADM1266_GO_COMMAND_SEQ_RES;
> +	write_data[1] = 0x0;
> +	ret = adm1266_group_cmd(data, ADM1266_GO_COMMAND, write_data, 2, true);
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "Could not stop all devs.");
> +		return ret;
> +	}
> +
> +	/* after issuing a stop command, wait 100 ms */
> +	msleep(100);
> +
> +	ret = adm1266_unlock_all_dev(data);
> +	if (ret < 0)
> +		goto lock_all_devices;
> +
> +	write_data[0] = 0x2;
> +	write_data[1] = 0x0;
> +	write_data[2] = 0x0;
> +	ret = adm1266_group_cmd(data, ADM1266_UPDATE_FW, write_data, 3, true);
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "Could not set bootloader mode.");
> +		goto lock_all_devices;
> +	}
> +
> +	/* wait for adm1266 to enter bootloader mode */
> +	msleep(2000);
> +
> +	ret = adm1266_write_hex(data, ADM1266_FIRMWARE_OFFSET,
> +				ADM1266_FIRMWARE_SIZE);
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "Could not write hex.");
> +		goto lock_all_devices;
> +	}
> +
> +	write_data[0] = ADM1266_GO_COMMAND_HARD_RES;
> +	ret = adm1266_group_cmd(data, ADM1266_GO_COMMAND, write_data, 2, true);
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "Could not reset all devs.");
> +		goto lock_all_devices;
> +	}
> +
> +lock_all_devices:
> +	adm1266_lock_all_dev(data);
> +
> +	return ret;
> +}
> +
> +/* check if firmware/config write has ended */
> +static bool adm1266_check_ending(struct adm1266_data *data, unsigned int offset,
> +				 unsigned int size)
> +{
> +	const u8 *ending_str = ":00000001FF";
> +	u8 *hex_cmd = data->dev_mem + offset;
> +	u8 *fw_end = data->dev_mem + offset + size;
> +
> +	hex_cmd = strnchr(hex_cmd, size, ':');
> +	for (; hex_cmd && hex_cmd < fw_end;
> +	     hex_cmd = strnchr(hex_cmd, size, ':')) {
> +		if (!strncmp(hex_cmd, ending_str, strlen(ending_str)))
> +			return true;
> +
> +		hex_cmd++;
> +	}
> +
> +	return false;
> +}
> +
> +static int adm1266_write_mem_cell(struct adm1266_data *data,
> +				  const struct nvmem_cell_info *mem_cell,
> +				  unsigned int offset,
> +				  u8 *val,
> +				  size_t bytes)
> +{
> +	unsigned int cell_end = mem_cell->offset + mem_cell->bytes;
> +	unsigned int cell_start = mem_cell->offset;
> +	int (*program_func)(struct adm1266_data *data);
> +	bool fw_writen;
> +
> +	switch (mem_cell->offset) {
> +	case ADM1266_FIRMWARE_OFFSET:
> +		if (!data->master_dev) {
> +			dev_err(&data->client->dev,
> +				"Only master programs the firmware.");
> +			return -EINVAL;
> +		}
> +
> +		program_func = &adm1266_program_firmware;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (offset < cell_start || offset + bytes >= cell_end)
> +		return -EINVAL;
> +
> +	if (offset == mem_cell->offset)
> +		memset(data->dev_mem + mem_cell->offset, 0, mem_cell->bytes);
> +
> +	memcpy(data->dev_mem + offset, val, bytes);
> +
> +	fw_writen = adm1266_check_ending(data, mem_cell->offset,
> +					 mem_cell->bytes);
> +
> +	if (fw_writen)
> +		return program_func(data);
> +
> +	return 0;
> +}
> +
> +static int adm1266_nvmem_write(void *priv, unsigned int offset, void *val,
> +			       size_t bytes)
> +{
> +	const struct nvmem_cell_info *mem_cell;
> +	struct adm1266_data *data = priv;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < data->nvmem_config.ncells; i++) {
> +		mem_cell = &adm1266_nvmem_cells[i];
> +
> +		if (!adm1266_cell_is_accessed(mem_cell, offset, bytes))
> +			continue;
> +
> +		ret = adm1266_write_mem_cell(data, mem_cell, offset,
> +					     val, bytes);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int adm1266_register_slave(struct adm1266_data *slave,
> +				  struct adm1266_data *master)
> +{
> +	struct adm1266_data_ref *slave_ref;
> +
> +	slave_ref = devm_kzalloc(&slave->client->dev,
> +				 sizeof(*slave_ref), GFP_KERNEL);
> +	if (!slave_ref)
> +		return -ENOMEM;
> +
> +	slave_ref->data = slave;
> +	INIT_LIST_HEAD(&slave_ref->list);
> +
> +	mutex_lock(&master->cascaded_devices_mutex);
> +	list_add_tail(&slave_ref->list, &master->cascaded_devices_list);
> +	mutex_unlock(&master->cascaded_devices_mutex);
> +
> +	return 0;
> +}
> +
> +static int adm1266_register(struct adm1266_data *data)
> +{
> +	struct fwnode_reference_args master_fwnode_ref;
> +	const struct fwnode_handle *fw;
> +	const struct fwnode_handle *master_fw;
> +	struct adm1266_data_ref *master_ref;
> +	int ret;
> +
> +	fw = dev_fwnode(&data->client->dev);
> +	INIT_LIST_HEAD(&data->cascaded_devices_list);
> +
> +	/* master devices do not have this property */
> +	if (!fwnode_property_present(fw, "adi,master-adm1266")) {
> +		data->master_dev = true;
> +
> +		master_ref = devm_kzalloc(&data->client->dev,
> +					  sizeof(*master_ref), GFP_KERNEL);
> +		if (!master_ref)
> +			return -ENOMEM;
> +
> +		master_ref->data = data;
> +		INIT_LIST_HEAD(&master_ref->list);
> +
> +		mutex_lock(&registered_masters_lock);
> +		list_add(&master_ref->list, &registered_masters);
> +		mutex_unlock(&registered_masters_lock);
> +	}
> +
> +	if (data->master_dev)
> +		return 0;
> +
> +	ret = fwnode_property_get_reference_args(fw, "adi,master-adm1266",
> +						 NULL, 0, 0,
> +						 &master_fwnode_ref);
> +	if (ret < 0) {
> +		dev_err(&data->client->dev,
> +			"Could not read adi,master-adm1266 property");
> +		return ret;
> +	}
> +
> +	mutex_lock(&registered_masters_lock);
> +
> +	/* search for the corresponding master of this slave */
> +	list_for_each_entry(master_ref, &registered_masters, list) {
> +		master_fw = dev_fwnode(&master_ref->data->client->dev);
> +
> +		if (master_fw == master_fwnode_ref.fwnode) {
> +			mutex_unlock(&registered_masters_lock);
> +			return adm1266_register_slave(data, master_ref->data);
> +		}
> +	}
> +
> +	mutex_unlock(&registered_masters_lock);
> +
> +	return -EPROBE_DEFER;
> +}
> +
>  static int adm1266_config_nvmem(struct adm1266_data *data)
>  {
>  	data->nvmem_config.name = dev_name(&data->client->dev);
>  	data->nvmem_config.dev = &data->client->dev;
>  	data->nvmem_config.root_only = true;
> -	data->nvmem_config.read_only = true;
>  	data->nvmem_config.owner = THIS_MODULE;
>  	data->nvmem_config.reg_read = adm1266_nvmem_read;
> +	data->nvmem_config.reg_write = adm1266_nvmem_write;
>  	data->nvmem_config.cells = adm1266_nvmem_cells;
>  	data->nvmem_config.ncells = ARRAY_SIZE(adm1266_nvmem_cells);
>  	data->nvmem_config.priv = data;
> @@ -527,6 +996,21 @@ static int adm1266_set_rtc(struct adm1266_data *data)
>  					  write_buf);
>  }
>  
> +static int adm1266_firmware_present(struct i2c_client *client)
> +{
> +	u8 read_buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(client, ADM1266_IC_DEVICE_REV,
> +					    8, read_buf);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Could not read firmware revision.");
> +		return ret;
> +	}
> +
> +	return !!(read_buf[0] | read_buf[1] | read_buf[2]);
> +}
> +
>  static int adm1266_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
>  	struct adm1266_data *data;
> @@ -545,6 +1029,21 @@ static int adm1266_probe(struct i2c_client *client, const struct i2c_device_id *
>  
>  	crc8_populate_msb(pmbus_crc_table, 0x7);
>  	mutex_init(&data->buf_mutex);
> +	mutex_init(&data->cascaded_devices_mutex);
> +
> +	ret = adm1266_register(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = adm1266_firmware_present(client);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!ret) {
> +		dev_notice(&client->dev, "Chip firmware not written.");
> +		return adm1266_config_nvmem(data);
> +	}
> +
>  
>  	ret = adm1266_config_gpio(data);
>  	if (ret < 0)
