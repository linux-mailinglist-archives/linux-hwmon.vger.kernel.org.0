Return-Path: <linux-hwmon+bounces-756-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ABD83BDC3
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jan 2024 10:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ECA82833BD
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jan 2024 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11941CA92;
	Thu, 25 Jan 2024 09:45:20 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE56D1C6AE;
	Thu, 25 Jan 2024 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706175920; cv=none; b=B/Ich17DAgWEjz7Pqpzxz2Hem/stCHcLZcOvFg8oG7TGwHAieIrg3mLPgA96o/mPYjDRcMfJ/vnQX0MDU046hzouAiBqACGrFYo+mXB817R2o9APgo2NZ8O9JNUpBemgegNLgb80FCAaNZPW+6ZcC28pjghdwLP0nCHM61YDKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706175920; c=relaxed/simple;
	bh=BBBMj/+LwJcWhyi1zR7X13yXCz0XNJvnrWKsG9hK2Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZos4rospTcDewzCP9PgjsmdpxM9ZN77iTcny3yiJENYhHOzofzuqW9VprwnocJTKeHCkcl4/tGvtqLlh+qp1qe3WotLPdVEjSIk3m67n2hSvdBfY++6FAG8Wu1H6vYf4lML6cqfZ2T1wUwYRnEzwciW6DBJPeAt715PG9q6S6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC8A3153B;
	Thu, 25 Jan 2024 01:46:02 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03AE83F73F;
	Thu, 25 Jan 2024 01:45:16 -0800 (PST)
Date: Thu, 25 Jan 2024 09:45:14 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>, Guenter Roeck <linux@roeck-us.net>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"groeck7@gmail.com" <groeck7@gmail.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"jdelvare@suse.com" <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3] hwmon: scmi-hwmon: implement change_mode for thermal
 zones
Message-ID: <ZbItqjt6RvCq306q@pluto>
References: <20240125064422.347002-1-peng.fan@oss.nxp.com>
 <b839f83f-c8c7-4fa8-8597-bdde1b40168a@roeck-us.net>
 <DU0PR04MB9417DAD2DBB8820344FEFB07887A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417DAD2DBB8820344FEFB07887A2@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Thu, Jan 25, 2024 at 07:06:25AM +0000, Peng Fan wrote:
> Hi Guenter,
> 

Hi,

> > Subject: Re: [PATCH V3] hwmon: scmi-hwmon: implement change_mode for
> > thermal zones
> > 
> > On 1/24/24 22:44, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The thermal sensors maybe disabled before kernel boot, so add
> > > change_mode for thermal zones to support configuring the thermal
> > > sensor to enabled state. If reading the temperature when the sensor is
> > > disabled, there will be error reported.
> > >
> > > The cost is an extra config_get all to SCMI firmware to get the status
> > > of the thermal sensor. No function level impact.
> > >
> > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >
> > > V3:
> > >   Update commit log to show it only applys to thermal
> > >   Add comments in code
> > >   Add R-b from Cristian
> > >
> > 
> > You didn't address my question regarding the behavior of hwmon attributes if
> > a sensor is disabled.
> 
> Would you please share a bit more on what attributes?
> You mean the files under /sys/class/hwmon/hwmon0?
> 
> If the sensor is disabled, when cat temp[x]_input, it will
> report:
> root@imx95-19x19-lpddr5-evk:/sys/class/hwmon/hwmon0# cat temp3_input
> cat: temp3_input: Protocol error
> 
> For enabled, it will report value:
> root@imx95-19x19-lpddr5-evk:/sys/class/hwmon/hwmon0# cat temp1_input
> 31900
> 
> > 
> > >   Guenter, I Cced linux@roeck-us.net when sending V1/V2
> > >   Let me Cc Guenter Roeck <groeck7@gmail.com> in V3, hope you not mind
> > >
> > This time I received it twice ;-).
> > 
> > > V2:
> > >   Use SCMI_SENS_CFG_IS_ENABLED & clear BIT[31:9] before update
> > > config(Thanks Cristian)
> > >
> > >   drivers/hwmon/scmi-hwmon.c | 39
> > ++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 39 insertions(+)
> > >
> > > diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
> > > index 364199b332c0..af2267fea5f0 100644
> > > --- a/drivers/hwmon/scmi-hwmon.c
> > > +++ b/drivers/hwmon/scmi-hwmon.c
> > > @@ -151,7 +151,46 @@ static int scmi_hwmon_thermal_get_temp(struct
> > thermal_zone_device *tz,
> > >   	return ret;
> > >   }
> > >
> > > +static int scmi_hwmon_thermal_change_mode(struct
> > thermal_zone_device *tz,
> > > +					  enum thermal_device_mode
> > new_mode) {
> > > +	int ret;
> > > +	u32 config;
> > > +	enum thermal_device_mode cur_mode =
> > THERMAL_DEVICE_DISABLED;
> > > +	struct scmi_thermal_sensor *th_sensor =
> > > +thermal_zone_device_priv(tz);
> > > +
> > > +	ret = sensor_ops->config_get(th_sensor->ph, th_sensor->info->id,
> > > +				     &config);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (SCMI_SENS_CFG_IS_ENABLED(config))
> > > +		cur_mode = THERMAL_DEVICE_ENABLED;
> > > +
> > > +	if (cur_mode == new_mode)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * Per SENSOR_CONFIG_SET sensor_config description:
> > > +	 * BIT[31:11] should be set to 0 if the sensor update interval does
> > > +	 * not need to be updated, so clear them.
> > > +	 * And SENSOR_CONFIG_GET does not return round up/down, so also
> > clear
> > > +	 * BIT[10:9] round up/down.
> > 
> > What does "clear" mean ? Is it going to round up ? Round down ? And why
> > would it be necessary to clear those bits if SENSOR_CONFIG_GET does not
> > return the current setting in the first place ?
> 
> This is to follow Cristian's suggestion to clear [31:9], because we only need
> to set the sensor to enabled state, no other attributes.
> My understanding is with BIT[31:11] set to 0, BIT[10:9] will not take effect.
> Cristian may help comment more since he suggested to clear them in V1/V2
> 
> You are right, currently config_get will return [10:2] as reserved,
> so config_set bit[10:9] no need touch. But config_get bit[10:2]
> may update to return the value in future SCMI spec?
> 
> Cristian or Sudeep may help comment here.

From the spec SENSOR_CONFIG_SET can also be used to set the chosen
update-interval for the sensor and the rounding-mode, but the specified
rounding mode refers only to the currently issued CONFIG_SET operation,
it is not a permanent configuration for the sensor: for this reason when
you instead issue a CONFIG_GET it does not make any sense to return the
rounding mode, since the interval returned by the GET is the already
(previously) rounded final value configured on the sensor.
So the spec is right and does not need any change in these regards.

By the spec, also, if you set the update-interval to 0 in a CONFIG_SET,
the chosen interval will remain unchanged, so the value of the ROUND bits
is indeed irrelevant.

Now, my (probably ill) advice to anyway clear also the round bits was aimed
at using some sort of well-known value in the SET (even though ignored)
given that the GET does specify those bits as reserved but you cannot be sure
what the previous GET just returned from the fw-of-the-day (maybe by mistake),
and if those bits will be effectively ignored on the SET given the
zeroed interval value.

Indeed, looking at this again, all of this is maybe just overthinking and it just
confusing at this point to needlessly clear also those ROUNDING bits, since not
required by the spec.

Just clear the interval bits, my bad.

Thanks,
Cristian

