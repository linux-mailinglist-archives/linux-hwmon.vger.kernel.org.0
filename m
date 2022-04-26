Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4701C510144
	for <lists+linux-hwmon@lfdr.de>; Tue, 26 Apr 2022 17:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243315AbiDZPEi (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 26 Apr 2022 11:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiDZPEg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 11:04:36 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF69D3AA6D
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 08:01:28 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-e5e433d66dso19651963fac.5
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=na606Kcv1ZqVsCgPEHgLX7Pq2inLu3PAUbSVWW8/roc=;
        b=d7Xfc7Hmcb12Wp3YTf8mgCOeoFt2sJaOAX4lYInEsvTynmY2mghXOt+HQtiW5rx5WV
         8q49ELEVNj+ACzSH6fDbS7MCRWs5WK72hgCgHep7LBsdrnX8hYDej/BYmtAQ6kiY7vq/
         Tagm/yltWoRdkahfryRWQNPzMxAMUsb15er9nO+Z4uIKgB2Z0pgTNnp8LdzqKQugY3vm
         qE2CWuTeZ4EXmlAfRSlZh+Z+RRpP/cOgEsodQ8HB5jv2kwaGKSx+mgSaTwRCNgLJBui3
         WhPUMVnnYP9fkfZuZt+4FuhXjFgcpiA6IhcuNLtiV/oYMuiVXXetEU5doQFO/7S6+auG
         p2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=na606Kcv1ZqVsCgPEHgLX7Pq2inLu3PAUbSVWW8/roc=;
        b=j17NPZBoZ6B2IMujFWhkbee546rNAw78/jA8/kMbEo1g+oOY+cF5DAc0RFGCuYiMA9
         AV/5xqMizod8obj9a3xYU/kY01EssM+i7C6DK79y2XEM/jMGRgJfyhaYtJul7gbnmmm3
         fFj5JjBq8syknb45kQxj4Ctp1Dh3OJ9V+jzuAqmcSgUkDVb2muckFHJa2TxM/aS4lYOT
         zCDdhmKEbQ5vQH6bspzLt4yByS4o+fzfskMdpG+vXlRMBrkqPUeFpdlvWWmwuxsAR04O
         zst5G46yr/rs5mlXCtv1wy7IxipG4zXDKL1OLKr5AoxGH/E22PQ/HJ5Rqzu0F1t1Ws9/
         5xbw==
X-Gm-Message-State: AOAM530YxmgRCc1ov7z65Eqy++VFBoKrccYEXflT03HiPc9LqNKC4NJW
        LROZd3OALSghb71TcU+N6Lnj/OMYuRQ=
X-Google-Smtp-Source: ABdhPJwD8XnquR4ht7JYmbpnxRZO1GP7MN1BCq6kr3zoQHSGzPLE+tJxIDnV0mtaxS7QuimRKYaILg==
X-Received: by 2002:a05:6870:11c1:b0:e6:dca:5fdc with SMTP id 1-20020a05687011c100b000e60dca5fdcmr13609174oav.280.1650985286442;
        Tue, 26 Apr 2022 08:01:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v17-20020a4a6951000000b00329d8b23f0dsm5602498oof.5.2022.04.26.08.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:01:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c813b754-591d-3fba-0450-7b73087c1de6@roeck-us.net>
Date:   Tue, 26 Apr 2022 08:01:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hwmon (occ): Avoid polling OCC during probe
Content-Language: en-US
To:     Eddie James <eajames@linux.ibm.com>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, joel@jms.id.au
References: <20220426144555.12120-1-eajames@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220426144555.12120-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/26/22 07:45, Eddie James wrote:
> Instead of polling the OCC during the probe, use the "occ_active"
> sysfs file to control when the driver polls the OCC for sensor data.
> The reason for this change is that the SBE, which is the device by
> which the driver communicates with the OCC, cannot handle communications
> during certain system state transitions.
> 

This is hackish, to say the least. Why not just instantiate the driver
manually instead if userspace interaction is indeed needed, and there
is no means to auto-instantiate it only after the hardware is ready ?

On the other side, what means does userspace have to determine that
the SBE/OCC is ready ? Can't that same mechanism not be used in the
kernel to auto-instantiate the driver ?

Guenter

> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>   drivers/hwmon/occ/common.c | 100 +++++++++++++++++++--------
>   drivers/hwmon/occ/common.h |   5 +-
>   drivers/hwmon/occ/p8_i2c.c |   2 +-
>   drivers/hwmon/occ/p9_sbe.c |   2 +-
>   drivers/hwmon/occ/sysfs.c  | 137 ++++++++++++++++++++++---------------
>   5 files changed, 156 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index f00cd59f1d19..d78f4bebc718 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1149,44 +1149,75 @@ static void occ_parse_poll_response(struct occ *occ)
>   		sizeof(*header), size + sizeof(*header));
>   }
>   
> -int occ_setup(struct occ *occ, const char *name)
> +int occ_active(struct occ *occ, bool active)
>   {
> -	int rc;
> -
> -	mutex_init(&occ->lock);
> -	occ->groups[0] = &occ->group;
> +	int rc = mutex_lock_interruptible(&occ->lock);
>   
> -	/* no need to lock */
> -	rc = occ_poll(occ);
> -	if (rc == -ESHUTDOWN) {
> -		dev_info(occ->bus_dev, "host is not ready\n");
> -		return rc;
> -	} else if (rc < 0) {
> -		dev_err(occ->bus_dev,
> -			"failed to get OCC poll response=%02x: %d\n",
> -			occ->resp.return_status, rc);
> +	if (rc)
>   		return rc;
> -	}
>   
> -	occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
> -	occ_parse_poll_response(occ);
> +	if (active) {
> +		if (occ->active) {
> +			rc = -EALREADY;
> +			goto unlock;
> +		}
>   
> -	rc = occ_setup_sensor_attrs(occ);
> -	if (rc) {
> -		dev_err(occ->bus_dev, "failed to setup sensor attrs: %d\n",
> -			rc);
> -		return rc;
> -	}
> +		occ->error_count = 0;
> +		occ->last_safe = 0;
>   
> -	occ->hwmon = devm_hwmon_device_register_with_groups(occ->bus_dev, name,
> -							    occ, occ->groups);
> -	if (IS_ERR(occ->hwmon)) {
> -		rc = PTR_ERR(occ->hwmon);
> -		dev_err(occ->bus_dev, "failed to register hwmon device: %d\n",
> -			rc);
> -		return rc;
> +		rc = occ_poll(occ);
> +		if (rc < 0) {
> +			dev_err(occ->bus_dev,
> +				"failed to get OCC poll response=%02x: %d\n",
> +				occ->resp.return_status, rc);
> +			goto unlock;
> +		}
> +
> +		occ->active = true;
> +		occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
> +		occ_parse_poll_response(occ);
> +
> +		rc = occ_setup_sensor_attrs(occ);
> +		if (rc) {
> +			dev_err(occ->bus_dev,
> +				"failed to setup sensor attrs: %d\n", rc);
> +			goto unlock;
> +		}
> +
> +		occ->hwmon = hwmon_device_register_with_groups(occ->bus_dev,
> +							       "occ", occ,
> +							       occ->groups);
> +		if (IS_ERR(occ->hwmon)) {
> +			rc = PTR_ERR(occ->hwmon);
> +			occ->hwmon = NULL;
> +			dev_err(occ->bus_dev,
> +				"failed to register hwmon device: %d\n", rc);
> +			goto unlock;
> +		}
> +	} else {
> +		if (!occ->active) {
> +			rc = -EALREADY;
> +			goto unlock;
> +		}
> +
> +		if (occ->hwmon)
> +			hwmon_device_unregister(occ->hwmon);
> +		occ->active = false;
> +		occ->hwmon = NULL;
>   	}
>   
> +unlock:
> +	mutex_unlock(&occ->lock);
> +	return rc;
> +}
> +
> +int occ_setup(struct occ *occ)
> +{
> +	int rc;
> +
> +	mutex_init(&occ->lock);
> +	occ->groups[0] = &occ->group;
> +
>   	rc = occ_setup_sysfs(occ);
>   	if (rc)
>   		dev_err(occ->bus_dev, "failed to setup sysfs: %d\n", rc);
> @@ -1195,6 +1226,15 @@ int occ_setup(struct occ *occ, const char *name)
>   }
>   EXPORT_SYMBOL_GPL(occ_setup);
>   
> +void occ_shutdown(struct occ *occ)
> +{
> +	occ_shutdown_sysfs(occ);
> +
> +	if (occ->hwmon)
> +		hwmon_device_unregister(occ->hwmon);
> +}
> +EXPORT_SYMBOL_GPL(occ_shutdown);
> +
>   MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
>   MODULE_DESCRIPTION("Common OCC hwmon code");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index 2dd4a4d240c0..64d5ec7e169b 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -106,6 +106,7 @@ struct occ {
>   	struct attribute_group group;
>   	const struct attribute_group *groups[2];
>   
> +	bool active;
>   	int error;                      /* final transfer error after retry */
>   	int last_error;			/* latest transfer error */
>   	unsigned int error_count;       /* number of xfr errors observed */
> @@ -123,9 +124,11 @@ struct occ {
>   	u8 prev_mode;
>   };
>   
> -int occ_setup(struct occ *occ, const char *name);
> +int occ_active(struct occ *occ, bool active);
> +int occ_setup(struct occ *occ);
>   int occ_setup_sysfs(struct occ *occ);
>   void occ_shutdown(struct occ *occ);
> +void occ_shutdown_sysfs(struct occ *occ);
>   void occ_sysfs_poll_done(struct occ *occ);
>   int occ_update_response(struct occ *occ);
>   
> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> index 9e61e1fb5142..da39ea28df31 100644
> --- a/drivers/hwmon/occ/p8_i2c.c
> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -223,7 +223,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client)
>   	occ->poll_cmd_data = 0x10;		/* P8 OCC poll data */
>   	occ->send_cmd = p8_i2c_occ_send_cmd;
>   
> -	return occ_setup(occ, "p8_occ");
> +	return occ_setup(occ);
>   }
>   
>   static int p8_i2c_occ_remove(struct i2c_client *client)
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 49b13cc01073..42fc7b97bb34 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -145,7 +145,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   	occ->poll_cmd_data = 0x20;		/* P9 OCC poll data */
>   	occ->send_cmd = p9_sbe_occ_send_cmd;
>   
> -	rc = occ_setup(occ, "p9_occ");
> +	rc = occ_setup(occ);
>   	if (rc == -ESHUTDOWN)
>   		rc = -ENODEV;	/* Host is shutdown, don't spew errors */
>   
> diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
> index b2f788a77746..2317301fc1e9 100644
> --- a/drivers/hwmon/occ/sysfs.c
> +++ b/drivers/hwmon/occ/sysfs.c
> @@ -6,13 +6,13 @@
>   #include <linux/export.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
>   #include <linux/sysfs.h>
>   
>   #include "common.h"
>   
>   /* OCC status register */
>   #define OCC_STAT_MASTER			BIT(7)
> -#define OCC_STAT_ACTIVE			BIT(0)
>   
>   /* OCC extended status register */
>   #define OCC_EXT_STAT_DVFS_OT		BIT(7)
> @@ -22,6 +22,25 @@
>   #define OCC_EXT_STAT_DVFS_VDD		BIT(3)
>   #define OCC_EXT_STAT_GPU_THROTTLE	GENMASK(2, 0)
>   
> +static ssize_t occ_active_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	int rc;
> +	bool active;
> +	struct occ *occ = dev_get_drvdata(dev);
> +
> +	rc = kstrtobool(buf, &active);
> +	if (rc)
> +		return rc;
> +
> +	rc = occ_active(occ, active);
> +	if (rc)
> +		return rc;
> +
> +	return count;
> +}
> +
>   static ssize_t occ_sysfs_show(struct device *dev,
>   			      struct device_attribute *attr, char *buf)
>   {
> @@ -31,54 +50,64 @@ static ssize_t occ_sysfs_show(struct device *dev,
>   	struct occ_poll_response_header *header;
>   	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>   
> -	rc = occ_update_response(occ);
> -	if (rc)
> -		return rc;
> +	if (occ->active) {
> +		rc = occ_update_response(occ);
> +		if (rc)
> +			return rc;
>   
> -	header = (struct occ_poll_response_header *)occ->resp.data;
> -
> -	switch (sattr->index) {
> -	case 0:
> -		val = !!(header->status & OCC_STAT_MASTER);
> -		break;
> -	case 1:
> -		val = !!(header->status & OCC_STAT_ACTIVE);
> -		break;
> -	case 2:
> -		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_OT);
> -		break;
> -	case 3:
> -		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_POWER);
> -		break;
> -	case 4:
> -		val = !!(header->ext_status & OCC_EXT_STAT_MEM_THROTTLE);
> -		break;
> -	case 5:
> -		val = !!(header->ext_status & OCC_EXT_STAT_QUICK_DROP);
> -		break;
> -	case 6:
> -		val = header->occ_state;
> -		break;
> -	case 7:
> -		if (header->status & OCC_STAT_MASTER)
> -			val = hweight8(header->occs_present);
> -		else
> +		header = (struct occ_poll_response_header *)occ->resp.data;
> +
> +		switch (sattr->index) {
> +		case 0:
> +			val = !!(header->status & OCC_STAT_MASTER);
> +			break;
> +		case 1:
>   			val = 1;
> -		break;
> -	case 8:
> -		val = header->ips_status;
> -		break;
> -	case 9:
> -		val = header->mode;
> -		break;
> -	case 10:
> -		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_VDD);
> -		break;
> -	case 11:
> -		val = header->ext_status & OCC_EXT_STAT_GPU_THROTTLE;
> -		break;
> -	default:
> -		return -EINVAL;
> +			break;
> +		case 2:
> +			val = !!(header->ext_status & OCC_EXT_STAT_DVFS_OT);
> +			break;
> +		case 3:
> +			val = !!(header->ext_status & OCC_EXT_STAT_DVFS_POWER);
> +			break;
> +		case 4:
> +			val = !!(header->ext_status &
> +				 OCC_EXT_STAT_MEM_THROTTLE);
> +			break;
> +		case 5:
> +			val = !!(header->ext_status & OCC_EXT_STAT_QUICK_DROP);
> +			break;
> +		case 6:
> +			val = header->occ_state;
> +			break;
> +		case 7:
> +			if (header->status & OCC_STAT_MASTER)
> +				val = hweight8(header->occs_present);
> +			else
> +				val = 1;
> +			break;
> +		case 8:
> +			val = header->ips_status;
> +			break;
> +		case 9:
> +			val = header->mode;
> +			break;
> +		case 10:
> +			val = !!(header->ext_status & OCC_EXT_STAT_DVFS_VDD);
> +			break;
> +		case 11:
> +			val = header->ext_status & OCC_EXT_STAT_GPU_THROTTLE;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else {
> +		if (sattr->index == 1)
> +			val = 0;
> +		else if (sattr->index <= 11)
> +			val = -ENODATA;
> +		else
> +			return -EINVAL;
>   	}
>   
>   	return sysfs_emit(buf, "%d\n", val);
> @@ -95,7 +124,8 @@ static ssize_t occ_error_show(struct device *dev,
>   }
>   
>   static SENSOR_DEVICE_ATTR(occ_master, 0444, occ_sysfs_show, NULL, 0);
> -static SENSOR_DEVICE_ATTR(occ_active, 0444, occ_sysfs_show, NULL, 1);
> +static SENSOR_DEVICE_ATTR(occ_active, 0644, occ_sysfs_show, occ_active_store,
> +			  1);
>   static SENSOR_DEVICE_ATTR(occ_dvfs_overtemp, 0444, occ_sysfs_show, NULL, 2);
>   static SENSOR_DEVICE_ATTR(occ_dvfs_power, 0444, occ_sysfs_show, NULL, 3);
>   static SENSOR_DEVICE_ATTR(occ_mem_throttle, 0444, occ_sysfs_show, NULL, 4);
> @@ -139,7 +169,7 @@ void occ_sysfs_poll_done(struct occ *occ)
>   	 * On the first poll response, we haven't yet created the sysfs
>   	 * attributes, so don't make any notify calls.
>   	 */
> -	if (!occ->hwmon)
> +	if (!occ->active)
>   		goto done;
>   
>   	if ((header->status & OCC_STAT_MASTER) !=
> @@ -148,12 +178,6 @@ void occ_sysfs_poll_done(struct occ *occ)
>   		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
>   	}
>   
> -	if ((header->status & OCC_STAT_ACTIVE) !=
> -	    (occ->prev_stat & OCC_STAT_ACTIVE)) {
> -		name = sensor_dev_attr_occ_active.dev_attr.attr.name;
> -		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
> -	}
> -
>   	if ((header->ext_status & OCC_EXT_STAT_DVFS_OT) !=
>   	    (occ->prev_ext_stat & OCC_EXT_STAT_DVFS_OT)) {
>   		name = sensor_dev_attr_occ_dvfs_overtemp.dev_attr.attr.name;
> @@ -227,8 +251,7 @@ int occ_setup_sysfs(struct occ *occ)
>   	return sysfs_create_group(&occ->bus_dev->kobj, &occ_sysfs);
>   }
>   
> -void occ_shutdown(struct occ *occ)
> +void occ_shutdown_sysfs(struct occ *occ)
>   {
>   	sysfs_remove_group(&occ->bus_dev->kobj, &occ_sysfs);
>   }
> -EXPORT_SYMBOL_GPL(occ_shutdown);

