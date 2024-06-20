Return-Path: <linux-hwmon+bounces-2745-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AE910812
	for <lists+linux-hwmon@lfdr.de>; Thu, 20 Jun 2024 16:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D779284414
	for <lists+linux-hwmon@lfdr.de>; Thu, 20 Jun 2024 14:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6AE1AD4AD;
	Thu, 20 Jun 2024 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W49EKvE8"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506B1AB35E;
	Thu, 20 Jun 2024 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718893400; cv=none; b=MgxZmU2izWdc10mtqhX79ta5WRkol2cWa/64ph+gWTTpRbfcXuPSzWXrPkBK/CbL0vXMzz+6SrFTT4kX8BaLN+K7o6HsMQhF42qcA0GwrRRjJK8mq0w907pfksioVHrEXI6m966ai4HFmN8mNF6zfxefQp2F2GhMNsp5u2Ybxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718893400; c=relaxed/simple;
	bh=+4W6JHoLbictFQEQCAFezXlFJOLnm+WKWCVrkiWdAOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYL+nMCq4lENXgRZEC78q0ENfQL6kBedTZ5UVMRitZ/qeMtjbxYOoZm9T35FAdbS8qeOgGE3YdpiKocUgJvfgNAli37NpCmk7Erou7YNaV70m4CPq/exbUtRsT0PGx21ZUeFXEiyZF881vFt9luak+DVaoOCxdNGubLU3e5wlFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W49EKvE8; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6bfd4b88608so753899a12.1;
        Thu, 20 Jun 2024 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718893398; x=1719498198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHxT3flbaEPPxQuVj7AheidwaIoPLVYY25DeO8a1/YU=;
        b=W49EKvE82DRf5GFU3KhMOhG1G5AYvg7QEp6n+r/s60Kp3bNFi/oYjs9vGMcU4kddxx
         dx5KGKYrh8Ln1le9ME8irJji8R4hrBMO7bEqPUOTVznZYGB2u9hLcAO01bDWVdZgn6y0
         ZthIpzQPZ8J6koRM9kCgzZQWQYZYRuL9JctQKF/q5LmM++numlJcd3EpA5S3mh5OpPWA
         up2fQhlsJFV0D9szH/ri9DRrxg76tx0utDwLxdImt3j33Rj2eHhXuwzt5kX2p/fyPxwz
         dlEZIEVcHgaqph0as2CaY+hGTCSsJmskmQzkxVAMdnIDRjX7T02N0GaPERIoRVADIhzo
         jN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718893398; x=1719498198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHxT3flbaEPPxQuVj7AheidwaIoPLVYY25DeO8a1/YU=;
        b=DHYRBv/nilcOjidwXift4U109zdqF2PvKUPFFKnTCF/tuT8FdtFrPGB0rxwzYJQMSj
         9txTfsdP7EEPAwuI+E7lWcLIXdK0TZ5BmIHDIvDBMdYcBxGtUM4O+3C35YsRm4Y/u28V
         VmcHJvlkPOArI1uTfDaB/zFmxG/5a5u+p6d2k4lRKkBrXt7lNt03rMGDvJjWGVEceMSW
         CtngoA2yoBwj6noC1GeTd6x6FYhfd+TY5qeqidPqCHWzvOqE2Rvz45YJesWsleImSIka
         LArDPDBimo2SD+gKTsLOXHpcvL1s7vfRmVDywpDL1ZF/DhD022Sj5ByCsZBqAv1alKCg
         HltA==
X-Forwarded-Encrypted: i=1; AJvYcCXAhDei7QgkEevNutfFePQmWxI42sbY3ubB8wxPHYvAsB6G7RMEE3LnZH9vAnC69yz+F1Kl860ffJNw0xtHy3xiwJP0ypaqwiFp22D8dX0fwLyac0cy4atFy7zl1zGZ8jp4EloEMyiRWlIkZ9M/Z28NPlXxssazKSn0WX6U2V5d1KpoTeuBrsbm5F0ljlsSFOmY5DsvlLfd1gScV40SdRuj
X-Gm-Message-State: AOJu0YzC9maGKLhE/s7oL8ur8IsndbaiNx/EgrS9hV1wSFQFhvPH/FRW
	sTxXOrsr67rv5QsB1Obyb68lNOWtJyyxJs6eFROt/xKsVg/4gSZvBVdIxQ==
X-Google-Smtp-Source: AGHT+IFbizT99phNhpGKm9snju0f+ayL5ZR+zNOlGENZy23mB9lvmEatcku8nuEVSMkICmYFwMj6RA==
X-Received: by 2002:a17:90b:97:b0:2c4:aa3d:f1e8 with SMTP id 98e67ed59e1d1-2c7b5b06d60mr5492012a91.14.1718893397960;
        Thu, 20 Jun 2024 07:23:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7e64ac485sm1733545a91.57.2024.06.20.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 07:23:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 20 Jun 2024 07:23:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: baneric926@gmail.com
Cc: jdelvare@suse.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
	kwliu@nuvoton.com, kcfeng0@nuvoton.com, DELPHINE_CHIU@wiwynn.com,
	Bonnie_Lo@wiwynn.com
Subject: Re: [PATCH v5 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
Message-ID: <dee8d81d-590e-4ae5-9771-9e1848b8ffe9@roeck-us.net>
References: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
 <20240322081158.4106326-3-kcfeng0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322081158.4106326-3-kcfeng0@nuvoton.com>

On Fri, Mar 22, 2024 at 04:11:58PM +0800, baneric926@gmail.com wrote:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> The NCT7363Y is a fan controller which provides up to 16
> independent FAN input monitors. It can report each FAN input count
> values. The NCT7363Y also provides up to 16 independent PWM
> outputs. Each PWM can output specific PWM signal by manual mode to
> control the FAN duty outside.
> 
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>

Sorry for the late reply. This got somehow lost in my queue.

> ---
>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/nct7363.rst |  33 +++
>  MAINTAINERS                     |   2 +
>  drivers/hwmon/Kconfig           |  11 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/nct7363.c         | 396 ++++++++++++++++++++++++++++++++
>  6 files changed, 444 insertions(+)
>  create mode 100644 Documentation/hwmon/nct7363.rst
>  create mode 100644 drivers/hwmon/nct7363.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 1ca7a4fe1f8f..0874f2f754f4 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -170,6 +170,7 @@ Hardware Monitoring Kernel Drivers
>     mpq8785
>     nct6683
>     nct6775
> +   nct7363
>     nct7802
>     nct7904
>     npcm750-pwm-fan
> diff --git a/Documentation/hwmon/nct7363.rst b/Documentation/hwmon/nct7363.rst
> new file mode 100644
> index 000000000000..1a6abce3a433
> --- /dev/null
> +++ b/Documentation/hwmon/nct7363.rst
> @@ -0,0 +1,33 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver nct7363
> +=====================
> +
> +Supported chip:
> +
> +  * Nuvoton NCT7363Y
> +
> +    Prefix: nct7363
> +
> +    Addresses: I2C 0x20, 0x21, 0x22, 0x23
> +
> +Author: Ban Feng <kcfeng0@nuvoton.com>
> +
> +
> +Description
> +-----------
> +
> +The NCT7363Y is a fan controller which provides up to 16 independent
> +FAN input monitors, and up to 16 independent PWM outputs with SMBus interface.
> +
> +
> +Sysfs entries
> +-------------
> +
> +Currently, the driver supports the following features:
> +
> +==========  ==========================================
> +fanX_input  provide current fan rotation value in RPM
> +
> +pwmX        get or set PWM fan control value.
> +==========  ==========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2705e44ffc0c..c016a0bed476 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15221,6 +15221,8 @@ M:	Ban Feng <kcfeng0@nuvoton.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> +F:	Documentation/hwmon/nct7363.rst
> +F:	drivers/hwmon/nct7363.c
>  
>  NETDEVSIM
>  M:	Jakub Kicinski <kuba@kernel.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 83945397b6eb..4ff19ea11001 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1658,6 +1658,17 @@ config SENSORS_NCT6775_I2C
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nct6775-i2c.
>  
> +config SENSORS_NCT7363
> +	tristate "Nuvoton NCT7363Y"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the Nuvoton NCT7363Y
> +	  hardware monitoring chip.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nct7363.
> +
>  config SENSORS_NCT7802
>  	tristate "Nuvoton NCT7802Y"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 5c31808f6378..cf7be22b916a 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -171,6 +171,7 @@ obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
>  nct6775-objs			:= nct6775-platform.o
>  obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
>  obj-$(CONFIG_SENSORS_NCT6775_I2C) += nct6775-i2c.o
> +obj-$(CONFIG_SENSORS_NCT7363)	+= nct7363.o
>  obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
>  obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
>  obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
> diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
> new file mode 100644
> index 000000000000..858296f5d5b3
> --- /dev/null
> +++ b/drivers/hwmon/nct7363.c
> @@ -0,0 +1,396 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2023 Nuvoton Technology corporation.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define NCT7363_REG_FUNC_CFG_BASE(x)	(0x20 + (x))
> +#define NCT7363_REG_PWMEN_BASE(x)	(0x38 + (x))
> +#define NCT7363_REG_FANINEN_BASE(x)	(0x41 + (x))
> +#define NCT7363_REG_FANINX_HVAL(x)	(0x48 + ((x) * 2))
> +#define NCT7363_REG_FANINX_LVAL(x)	(0x49 + ((x) * 2))
> +#define NCT7363_REG_FSCPXDUTY(x)	(0x90 + ((x) * 2))
> +
> +#define PWM_SEL(x)			(BIT(0) << ((x) * 2))
> +#define FANIN_SEL(x)			(BIT(1) << ((x < 8) ? \
> +					 (((x) + 8) * 2) : \
> +					 (((x) % 8) * 2)))
> +#define VALUE_TO_REG(x, y)		(((x) >> ((y) * 8)) & 0xFF)
> +
> +#define NCT7363_FANINX_LVAL_MASK	GENMASK(4, 0)
> +#define NCT7363_FANIN_MASK		GENMASK(12, 0)
> +
> +#define NCT7363_PWM_COUNT		16
> +
> +static inline unsigned int FAN_FROM_REG(u16 val)

Please use lower case for functions, even if inline.

> +{
> +	if (val == NCT7363_FANIN_MASK || val == 0)
> +		return 0;
> +
> +	return (1350000UL / val);
> +}
> +
> +enum chips { nct7363, nct7362 };
> +

Those enums are not actually used. Are they needed ?

> +static const struct i2c_device_id nct7363_id[] = {
> +	{ "nct7363", nct7363 },
> +	{ "nct7362", nct7362 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, nct7363_id);
> +
> +static const struct of_device_id nct7363_of_match[] = {
> +	{ .compatible = "nuvoton,nct7363", .data = (void *)nct7363 },
> +	{ .compatible = "nuvoton,nct7362", .data = (void *)nct7362 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, nct7363_of_match);
> +
> +struct nct7363_data {
> +	struct regmap		*regmap;
> +	struct mutex		lock;		/* protect register access */
> +
> +	u16			fanin_mask;
> +	u16			pwm_mask;
> +};
> +
> +static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct nct7363_data *data = dev_get_drvdata(dev);
> +	unsigned int hi, lo, rpm;
> +	int ret = 0;
> +	u16 cnt;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		/*
> +		 * High-byte register should be read first to latch
> +		 * synchronous low-byte value
> +		 */
> +		mutex_lock(&data->lock);
> +		ret = regmap_read(data->regmap,
> +				  NCT7363_REG_FANINX_HVAL(channel), &hi);
> +		if (ret)
> +			goto out;
> +
> +		ret = regmap_read(data->regmap,
> +				  NCT7363_REG_FANINX_LVAL(channel), &lo);

Please consider using regmap_read_bulk() to avoid the locks.

> +		if (ret)
> +			goto out;
> +		mutex_unlock(&data->lock);
> +
> +		cnt = (hi << 5) | (lo & NCT7363_FANINX_LVAL_MASK);
> +		rpm = FAN_FROM_REG(cnt);
> +		*val = (long)rpm;

rpm and the typecast are unnecessary. Just use
		*val = fan_from_reg(cnt);

> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +out:
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +static umode_t nct7363_fan_is_visible(const void *_data, u32 attr, int channel)
> +{
> +	const struct nct7363_data *data = _data;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		if (data->fanin_mask & BIT(channel))
> +			return 0444;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nct7363_read_pwm(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct nct7363_data *data = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		ret = regmap_read(data->regmap,
> +				  NCT7363_REG_FSCPXDUTY(channel), &regval);
> +		if (ret)
> +			return ret;
> +
> +		*val = (long)regval;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct7363_write_pwm(struct device *dev, u32 attr, int channel,
> +			     long val)
> +{
> +	struct nct7363_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > 255)
> +			return -EINVAL;
> +
> +		ret = regmap_write(data->regmap,
> +				   NCT7363_REG_FSCPXDUTY(channel), val);
> +
> +		return ret;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t nct7363_pwm_is_visible(const void *_data, u32 attr, int channel)
> +{
> +	const struct nct7363_data *data = _data;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (data->pwm_mask & BIT(channel))
> +			return 0644;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nct7363_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return nct7363_read_fan(dev, attr, channel, val);
> +	case hwmon_pwm:
> +		return nct7363_read_pwm(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct7363_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_pwm:
> +		return nct7363_write_pwm(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t nct7363_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return nct7363_fan_is_visible(data, attr, channel);
> +	case hwmon_pwm:
> +		return nct7363_pwm_is_visible(data, attr, channel);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *nct7363_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT),

Other potential attributes:

- enable (register 0x41, 0x42, and possibly 0x40)
- alarm (register 0x34, 0x35)
- min (register 0x6c, 0x6d)

> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT),

Other potential attributes:

- enable (register 0x38)
- freq (register 0x91, ...)

All those could be added later, of course, but I would suggest to at least
add the fan speed low limit and alarm attributes.

> +	NULL
> +};
> +
> +static const struct hwmon_ops nct7363_hwmon_ops = {
> +	.is_visible = nct7363_is_visible,
> +	.read = nct7363_read,
> +	.write = nct7363_write,
> +};
> +
> +static const struct hwmon_chip_info nct7363_chip_info = {
> +	.ops = &nct7363_hwmon_ops,
> +	.info = nct7363_info,
> +};
> +
> +static int nct7363_init_chip(struct nct7363_data *data)
> +{
> +	u32 func_config = 0;
> +	int i, ret;
> +
> +	/* Pin Function Configuration */
> +	for (i = 0; i < NCT7363_PWM_COUNT; i++) {
> +		if (data->pwm_mask & BIT(i))
> +			func_config |= PWM_SEL(i);
> +		if (data->fanin_mask & BIT(i))
> +			func_config |= FANIN_SEL(i);
> +	}
> +
> +	for (i = 0; i < 4; i++) {
> +		ret = regmap_write(data->regmap, NCT7363_REG_FUNC_CFG_BASE(i),
> +				   VALUE_TO_REG(func_config, i));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* PWM and FANIN Monitoring Enable */
> +	for (i = 0; i < 2; i++) {
> +		ret = regmap_write(data->regmap, NCT7363_REG_PWMEN_BASE(i),
> +				   VALUE_TO_REG(data->pwm_mask, i));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, NCT7363_REG_FANINEN_BASE(i),
> +				   VALUE_TO_REG(data->fanin_mask, i));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nct7363_present_pwm_fanin(struct device *dev,
> +				     struct device_node *child,
> +				     struct nct7363_data *data)
> +{
> +	u8 fanin_ch[NCT7363_PWM_COUNT];
> +	struct of_phandle_args args;
> +	int ret, fanin_cnt;
> +	u8 ch, index;
> +
> +	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
> +					 0, &args);
> +	if (ret)
> +		return ret;
> +
> +	if (args.args[0] >= NCT7363_PWM_COUNT)
> +		return -EINVAL;
> +	data->pwm_mask |= BIT(args.args[0]);
> +
> +	fanin_cnt = of_property_count_u8_elems(child, "tach-ch");
> +	if (fanin_cnt < 1 || fanin_cnt > NCT7363_PWM_COUNT)
> +		return -EINVAL;
> +
> +	ret = of_property_read_u8_array(child, "tach-ch", fanin_ch, fanin_cnt);
> +	if (ret)
> +		return ret;
> +
> +	for (ch = 0; ch < fanin_cnt; ch++) {
> +		index = fanin_ch[ch];
> +		if (index >= NCT7363_PWM_COUNT)
> +			return -EINVAL;
> +		data->fanin_mask |= BIT(index);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config nct7363_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,

Your call to make, but this doesn't use regmap caching capabilities which
might be really useful here. Most of the registers (all but the count and
status registers, plus the gpio input registers if/when gpio support is
added) are not volatile and could be cached.

> +};
> +
> +static int nct7363_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *child;
> +	struct nct7363_data *data;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = devm_regmap_init_i2c(client, &nct7363_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	mutex_init(&data->lock);
> +
> +	for_each_child_of_node(dev->of_node, child) {
> +		ret = nct7363_present_pwm_fanin(dev, child, data);
> +		if (ret) {
> +			of_node_put(child);
> +			return ret;
> +		}
> +	}
> +
> +	/* Initialize the chip */
> +	ret = nct7363_init_chip(data);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev =
> +		devm_hwmon_device_register_with_info(dev, client->name, data,
> +						     &nct7363_chip_info, NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct i2c_driver nct7363_driver = {
> +	.class = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = "nct7363",
> +		.of_match_table = nct7363_of_match,
> +	},
> +	.probe = nct7363_probe,
> +	.id_table = nct7363_id,
> +};
> +
> +module_i2c_driver(nct7363_driver);
> +
> +MODULE_AUTHOR("CW Ho <cwho@nuvoton.com>");
> +MODULE_AUTHOR("Ban Feng <kcfeng0@nuvoton.com>");
> +MODULE_DESCRIPTION("NCT7363 Hardware Monitoring Driver");
> +MODULE_LICENSE("GPL");

