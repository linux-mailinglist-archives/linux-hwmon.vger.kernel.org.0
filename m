Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E34D16B41F
	for <lists+linux-hwmon@lfdr.de>; Mon, 24 Feb 2020 23:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgBXWej (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 24 Feb 2020 17:34:39 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32864 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgBXWej (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 17:34:39 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay11so4639819plb.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 14:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/59OLYrLWvyumBUnjF38iX2U37AaJPCIOzEhQ5AQ6wE=;
        b=YBY8q7kbfosg5Zu8+XPhjBA4K6BBpr7bwHdlqnAeFsdxowhXHw4tdQQzufwLRkIM9z
         mAPbtRg58bkO5jlOmLF7d903izsOjDwN71oIdmF5ZNeMFPPewCnGsnZErR1Oz+T85+5F
         qXxMXvpMsNioLis/X1OTiMRWw+QkngT3EblcIvu2wMgpifrX2x7l6m1TZCmPmahhdH1e
         +evxVN4ZPnmvr6WZSEkSv32m9qAF+GUtE7O4vyg98MZNcdGRqj3cQnoxNRIR+QwElPlR
         dPdF5YtOsaxBpvD1Jsvgz1P0swzDUBgiKDwQthVDaD03w8rfrw37coGQI4kLNTC3nwiv
         /yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/59OLYrLWvyumBUnjF38iX2U37AaJPCIOzEhQ5AQ6wE=;
        b=bGJAdhfCn4iHJSefstTC5paVz85WzsvUFcEW0JUY0IePcMm+63qPKHCQoT04H6iGBR
         8hSCyiRUECtFjTDO44Q163PnJVvIB1kxCn/meTqX0oi0s8/cVICRDAOxZ+fOEhtwsTni
         fhl3L7V73z2bedv848GspCmAdFJR+S3LqdgnARRQlT/ccJvs+aF0bqUygKPzd/sxTGre
         gldO31hvPTMulgnq7eCcFqHR1+eXpezMI+iHEPNNJh5304lzsu3PL69yXj/Ly/7R9W/g
         JETRf+yohdgRZ8+E898bHVvrNQk/i/DQCBJ+nN+vSaz2nJ57ZhwtsJobdPJiRzJVmqGa
         fTow==
X-Gm-Message-State: APjAAAU9FLiMv50A5qcFh1FM90o1AX8hVE7v1TaHoqggj+VWX8I+M1yw
        jyLkVGXFiBJk4CHiZe4Il1vGRN2F
X-Google-Smtp-Source: APXvYqxqI3VTz4WB/YyM0TQ8CBbwmaGX50CINSUHQoIh/rgTbPN0ufzc0i6Rfdba0X8SPjVRNImW/w==
X-Received: by 2002:a17:90b:309:: with SMTP id ay9mr1464513pjb.22.1582583678803;
        Mon, 24 Feb 2020 14:34:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z30sm14088849pff.131.2020.02.24.14.34.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:34:38 -0800 (PST)
Date:   Mon, 24 Feb 2020 14:34:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
Message-ID: <20200224223436.GA7751@roeck-us.net>
References: <20200224131316.28238-1-vadimp@mellanox.com>
 <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
 <DB6PR0501MB23584EB4453A14BC1EE29C13A2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
 <20200224222415.GA7282@roeck-us.net>
 <DB6PR0501MB2358937B2A0A5405018B5EABA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB2358937B2A0A5405018B5EABA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Feb 24, 2020 at 10:29:28PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Tuesday, February 25, 2020 12:24 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: linux-hwmon@vger.kernel.org
> > Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
> > historical registers for TPS53688
> > 
> > On Mon, Feb 24, 2020 at 10:13:18PM +0000, Vadim Pasternak wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > > Sent: Monday, February 24, 2020 4:51 PM
> > > > To: Vadim Pasternak <vadimp@mellanox.com>
> > > > Cc: linux-hwmon@vger.kernel.org
> > > > Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
> > > > historical registers for TPS53688
> > > >
> > > > On 2/24/20 5:13 AM, Vadim Pasternak wrote:
> > > > > TPS53688 supports historical registers. Patch allows exposing the
> > > > > next attributes for the historical registers in 'sysfs':
> > > > > - curr{x}_reset_history;
> > > > > - in{x}_reset_history;
> > > > > - power{x}_reset_history;
> > > > > - temp{x}_reset_history;
> > > > > - curr{x}_highest;
> > > > > - in{x}_highest;
> > > > > - power{x}_input_highest;
> > > > > - temp{x}_highest;
> > > > > - curr{x}_lowest;
> > > > > - in{x}_lowest;
> > > > > - power{x}_input_lowest;
> > > > > - temp{x}_lowest.
> > > > >
> > > > > This patch is required patch:
> > > > > "hwmon: (pmbus/core) Add callback for register to data conversion".
> > > > >
> > > > > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > > > > ---
> > > > >   drivers/hwmon/pmbus/tps53679.c | 244
> > > > ++++++++++++++++++++++++++++++++++++++++-
> > > > >   1 file changed, 243 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/hwmon/pmbus/tps53679.c
> > > > > b/drivers/hwmon/pmbus/tps53679.c index 157c99ffb52b..ae5ce144e5fe
> > > > > 100644
> > > > > --- a/drivers/hwmon/pmbus/tps53679.c
> > > > > +++ b/drivers/hwmon/pmbus/tps53679.c
> > > > > @@ -34,6 +34,227 @@ enum chips {
> > > > >
> > > > >   #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases,
> > per page
> > > > */
> > > > >
> > > > > +/* Registers for highest and lowest historical values records */
> > > > > +#define TPS53688_VOUT_PEAK		0xd1
> > > > > +#define TPS53688_IOUT_PEAK		0xd2
> > > > > +#define TPS53688_TEMP_PEAK		0xd3
> > > > > +#define TPS53688_VIN_PEAK		0xd5
> > > > > +#define TPS53688_IIN_PEAK		0xd6
> > > > > +#define TPS53688_PIN_PEAK		0xd7
> > > > > +#define TPS53688_POUT_PEAK		0xd8
> > > > > +#define TPS53688_HISTORY_REG_BUF_LEN	5
> > > > > +#define TPS53688_HISTORY_REG_MIN_OFFSET	3
> > > > > +#define TPS53688_HISTORY_REG_MAX_OFFSET	1
> > > > > +
> > > > > +const static u8 tps53688_reset_logging[] = { 0x04, 0x00, 0x01,
> > > > > +0x00,
> > > > > +0x00 }; const static u8 tps53688_resume_logging[] = { 0x04, 0x20,
> > > > > +0x00, 0x00, 0x00 };
> > > > > +
> > > > Passing the length as 1st field seems wrong.
> > > >
> > > > > +static int tps53688_reg2data(u16 reg, int data, long *val) {
> > > > > +	s16 exponent;
> > > > > +	s32 mantissa;
> > > > > +
> > > > > +	if (data == 0)
> > > > > +		return data;
> > > > > +
> > > > > +	switch (reg) {
> > > > > +	case PMBUS_VIRT_READ_VOUT_MIN:
> > > > > +	case PMBUS_VIRT_READ_VOUT_MAX:
> > > > > +		/* Convert to LINEAR11. */
> > > > > +		exponent = ((s16)data) >> 11;
> > > > > +		mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
> > > > > +		*val = mantissa * 1000L;
> > > > > +		if (exponent >= 0)
> > > > > +			*val <<= exponent;
> > > > > +		else
> > > > > +			*val >>= -exponent;
> > > > > +		return 0;
> > > > > +	default:
> > > > > +		return -ENODATA;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > As with the xpde driver, I would suggest to implement the conversion
> > > > in the read_word_data function.
> > > >
> > > > > +static int
> > > > > +tps53688_get_history(struct i2c_client *client, int reg, int page, int
> > unused,
> > > > > +		     int offset)
> > > >
> > > > What is the point of passing "unused" to this function ?
> > > >
> > > > > +{
> > > > > +	u8 buf[TPS53688_HISTORY_REG_BUF_LEN];
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = pmbus_set_page(client, page, 0);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = i2c_smbus_read_i2c_block_data(client, reg,
> > > > > +					    TPS53688_HISTORY_REG_BUF_LEN,
> > > > > +					    buf);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +	else if (ret != TPS53688_HISTORY_REG_BUF_LEN)
> > > > > +		return -EIO;
> > > >
> > > > I am a bit confused here. Are you sure this returns (and is supposed
> > > > to return)
> > > > 5 bytes of data, not 4, and that the data offsets are 1 and 3, not 0 and 2 ?
> > > > i2c_smbus_read_i2c_block_data() returns the length, and only copies
> > > > the data into the buffer, not the length field.
> > > >
> > > > > +
> > > > > +	return *(u16 *)(buf + offset);
> > > >
> > > > This implies host byte order. I don't think it will work on big endian systems.
> > > > Besides, it won't work on systems which can not directly read from
> > > > odd addresses (if the odd offsets are indeed correct).
> > > >
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +tps53688_reset_history(struct i2c_client *client, int reg) {
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = i2c_smbus_write_i2c_block_data(client, reg,
> > > > > +					     TPS53688_HISTORY_REG_BUF_LEN,
> > > > > +					     tps53688_reset_logging);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = i2c_smbus_write_i2c_block_data(client, reg,
> > > > > +					     TPS53688_HISTORY_REG_BUF_LEN,
> > > > > +					     tps53688_resume_logging);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > Are you sure that a single write of 00 00 01 00 wouldn't do it ?
> > > > Is it indeed necessary to resume logging after resetting it ?
> > > >
> > >
> > > Yes.
> > > I used initially '0x00, 0x01, 0x00' and it didn't work for me.
> > > Then I managed to have a call with TI and after some debug they said I
> > > should resume after reset, so I added '0x02 0x00, 0x00, 0x00'.
> > >
> > > Datasheet says:
> > > Issue a write transaction with the following values to control peak logging
> > functions.
> > > Logging is not automatically started or stopped by TPS536xx.
> > > 0000 0001h Pause minimum value logging
> > > 0000 0002h Pause maximum value logging
> > > 0000 0004h Pause minimum and maximum value logging
> > > 0000 0008h Resume minimum value logging (if paused)
> > > 0000 0010h Resume maximum value logging (if paused)
> > > 0000 0020h Resume minimum and maximum value logging (if paused)
> > > 0000 0040h Reset the minimum value logging
> > > 0000 0080h Reset the maximum value logging
> > > 0000 0100h Reset both minimum and maximum value logging Other
> > > Invalid/Unsupported data.
> > >
> > > So it's not active by default and should be resumed for starting logging.
> > >
> > > Because of that I also added tps53688_reset_history_all() in probe,
> > > because otherwise after boot these registers have some abnormal values.
> > > But anyway I'll drop this routine following your comment below.
> > > Also considering that driver can be re-probed and in this case history
> > > after the first reset/resume could be important.
> > >
> > Thanks for the explanation.
> > 
> > That means though that you'll need to call something like
> > tps53688_start_logging_all() in the probe function, or am I missing something ?
> > Otherwise the user would have to explicitly reset the history to start logging it,
> > which would not be desirable either.
> 
> Yes, this is was my intention to activate logging on probe and do not
> it explicitly through all '{x}_reset_history' attributes.
> So, keep it in probe and just rename to tps53688_start_logging_all()?
> 

As long as it doesn't also _reset_ the history, sure.

Thanks,
Guenter
