Return-Path: <linux-hwmon+bounces-4122-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE948973ACF
	for <lists+linux-hwmon@lfdr.de>; Tue, 10 Sep 2024 17:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DDB31F24CA9
	for <lists+linux-hwmon@lfdr.de>; Tue, 10 Sep 2024 15:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4CF19884B;
	Tue, 10 Sep 2024 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rPteJHj/"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1A189903
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980456; cv=none; b=XH6Waz2wAP79cD+QJuo8ODvo7yj/fMN8zMi6LOJf0n1nbrbS/DrYPZywSr2EcYZx/wsez4eoq6sw/VLhb1ONEP/xmOZGy2/rD2J4ePtr4H6TJYbkSpPtJLeHu4QPNS7uJDrGioMeQrOR+9Ov8DclJEAxFxPaKi8NfWLbh1MxX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980456; c=relaxed/simple;
	bh=AV+bZEikSbgiTFjF5uYp023i/NLpDIKEW9JH0HUq9Kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l3rGFDZSZR5O7171DTRAJR5zv6qbipG0+L22sgbdeZOgqQJCBYj1MYHC6TnOO7vehKt/08IyFyi94EmpHbhlBTfODriDS3jksnY91YIDjwYvlUGibf7cxM/yNtUZY3+gSM++7UvI0/6oyj3hr8++DjdToV/W4plOmb9d+Ox3jEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rPteJHj/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374bd059b12so3479527f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2024 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725980451; x=1726585251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hr9Fc/Cxch33RdNkyPqNKXWz12st/NBG82QCWR7Y3c=;
        b=rPteJHj//3aRs/HsvKNtXDYCCpGHO1ZpvKst4XwCoTb4LXZ3K1OEwffLQPVRrhG8zj
         dJzXq9EXrg3XnYGTgC0TYmFVjIR0fRdf2kBrH95TyJVLBXlL2GD6weUfk0Wc4KSssMv+
         W7HvCHZcenDFc9K9eu9pYKUAlZvo8G7aH3pMi98MwSZBFaEYV7pXJ7pa7vh76iM4DVZJ
         yaRVuYc2toD+pzVwHr+YFF4YWgQXjHgW/jMvMf6gEFYfYShMj/CFl1xCblkxL0JBDb81
         NEzlOxVktrAEVtyeYp1kXXlBbVT1mfZJmJ6CkXmKflIhtJphbstpNO7GKdP1UU5wZmr5
         DYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980451; x=1726585251;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hr9Fc/Cxch33RdNkyPqNKXWz12st/NBG82QCWR7Y3c=;
        b=dSZ+EwObRpx5E4LIueWZ1y+nUOIj018xP4RFOzvIY95BZSfZh+UgECq3FuNtTHAvg8
         TrNZBnWqKTxbykp5zjKzjn6RtZvMHLMmE05b+mIB2CDwYLCQTcThTEtVZWq4idWmhWV9
         zSjlUSL+FQjaXO9PKUkX1vsmEk+yVvDhzmSUbcUaLPyi8OJ34ovKAeZkgANXVIA5zIVU
         t+PSgieEwSjH1qhySsNDF1HOi/fAjq0PiBjRsxESWWf2mup6Q2/pXFJSi7DaExbkBmr7
         LVtCCbOe4daphCC+P7qnx/ZF9Q+81tQNRTUTrypeg3w3k4qh2b5QkxVBkxn4bGMI31qO
         z57A==
X-Forwarded-Encrypted: i=1; AJvYcCUtfjea9vAfBQ34nPqEoAQUayIDbrXK624Az+bgvNkh2jz1l2DgX8+l1BPTOu4sUXRRcNQ7MBH/e54FKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhEVlfxfeK9SZkL6o7I+ZlsCoTGJTh7FtdYJMdpbbwqOm1Quv
	fi/bh9DzT3H7VWv0KNA02WftXv5jz0YXs0KFwKgJnXg4iyqHax/t6lnk3GNXoag=
X-Google-Smtp-Source: AGHT+IFhCLPyTLBtd41NDEC+LPfICx6brFq87NJZa0zlOyce74MQhtfSCKZlYGpLhIP7wd2Pwa2MrA==
X-Received: by 2002:adf:f7ce:0:b0:374:c847:85c with SMTP id ffacd0b85a97d-378949fa718mr6955822f8f.24.1725980450611;
        Tue, 10 Sep 2024 08:00:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de00fsm9164949f8f.99.2024.09.10.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 08:00:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Delphine CC
 Chiu <Delphine_CC_Chiu@Wiwynn.com>,  linux-hwmon@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (pmbus/core) add POWER_GOOD signal limits
 support
In-Reply-To: <08b6d9af-51b7-4eda-a4f6-62b688665fd9@roeck-us.net> (Guenter
	Roeck's message of "Tue, 10 Sep 2024 07:37:09 -0700")
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
	<20240909-tps25990-v1-2-39b37e43e795@baylibre.com>
	<d76290e0-f5e7-4192-92b8-94f260270fe3@roeck-us.net>
	<1j8qw0t3ej.fsf@starbuckisacylon.baylibre.com>
	<08b6d9af-51b7-4eda-a4f6-62b688665fd9@roeck-us.net>
Date: Tue, 10 Sep 2024 17:00:49 +0200
Message-ID: <1jr09rsgda.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 10 Sep 2024 at 07:37, Guenter Roeck <linux@roeck-us.net> wrote:

> On 9/9/24 23:43, Jerome Brunet wrote:
>> On Mon 09 Sep 2024 at 11:16, Guenter Roeck <linux@roeck-us.net> wrote:
>>=20
>>> On 9/9/24 08:39, Jerome Brunet wrote:
>>>> Add support for POWER_GOOD_ON and POWER_GOOD_OFF standard PMBus comman=
ds.
>>>> For PMBus devices that offer a POWER_GOOD signal, these commands are u=
sed
>>>> for setting the output voltage at which a power good signal should be
>>>> asserted and negated.
>>>> Power Good signals are device and manufacturer specific. Many factors
>>>> other
>>>> than output voltage may be used to determine whether or not the POWER_=
GOOD
>>>> signal is to be asserted. PMBus device users are instructed to consult=
 the
>>>> device manufacturer=E2=80=99s product literature for the specifics of =
the device
>>>> they are using.
>>>> Note that depending on the choice of the device manufacturer that a
>>>> device
>>>> may drive a POWER_GOOD signal high or low to indicate that the signal =
is
>>>> asserted.
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>> ---
>>>>    drivers/hwmon/pmbus/pmbus.h      | 3 +++
>>>>    drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
>>>>    2 files changed, 9 insertions(+)
>>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>>> index 5d5dc774187b..e322d2dd9fb7 100644
>>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>>> @@ -78,6 +78,9 @@ enum pmbus_regs {
>>>>    	PMBUS_IIN_OC_FAULT_LIMIT	=3D 0x5B,
>>>>    	PMBUS_IIN_OC_WARN_LIMIT		=3D 0x5D,
>>>>    +	PMBUS_POWER_GOOD_ON		=3D 0x5E,
>>>> +	PMBUS_POWER_GOOD_OFF		=3D 0x5F,
>>>> +
>>>>    	PMBUS_POUT_OP_FAULT_LIMIT	=3D 0x68,
>>>>    	PMBUS_POUT_OP_WARN_LIMIT	=3D 0x6A,
>>>>    	PMBUS_PIN_OP_WARN_LIMIT		=3D 0x6B,
>>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pm=
bus_core.c
>>>> index 0ea6fe7eb17c..94ddf0166770 100644
>>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>>> @@ -1768,6 +1768,12 @@ static const struct pmbus_limit_attr vout_limit=
_attrs[] =3D {
>>>>    		.attr =3D "crit",
>>>>    		.alarm =3D "crit_alarm",
>>>>    		.sbit =3D PB_VOLTAGE_OV_FAULT,
>>>> +	}, {
>>>> +		.reg =3D PMBUS_POWER_GOOD_ON,
>>>> +		.attr =3D "good_on",
>>>> +	}, {
>>>> +		.reg =3D PMBUS_POWER_GOOD_OFF,
>>>> +		.attr =3D "good_off",
>>>>    	}, {
>>>>    		.reg =3D PMBUS_VIRT_READ_VOUT_AVG,
>>>>    		.update =3D true,
>>>>
>>>
>>> Those attributes are not hardware monitoring attributes and therefore n=
ot
>>> acceptable. In general I am not sure if they should be configurable in =
the
>>> first place, but definitely not from the hardware monitoring subsystem.
>>> Maybe the regulator subsystem callbacks set_over_voltage_protection and
>>> set_under_voltage_protection would be appropriate (with severity
>>> REGULATOR_SEVERITY_PROT), but that should be discussed with regulator
>>> subsystem maintainers.
>> According to PMBUS spec, there is no protection associated with that
>> command. It just tells when the output voltage is considered good, when
>> it is not. What it does after that really depends the device, it may
>> drive a pin for example (or an LED indicator in my case).
>>=20
>
> It is much more likely that it connects to the reset signal on the board,
> or it enables/disables power to parts of the board.

That's not what PMBus spec says about it:

"""
15.32. POWER_GOOD Signal Limits
For PMBus devices that offer a POWER_GOOD signal, these commands are used f=
or
setting the output voltage at which a power good signal should be asserted =
and negated.
Power Good signals will be device and manufacturer specific. Many factors o=
ther than
output voltage may be used to determine whether or not the POWER_GOOD signa=
l is to
be asserted. PMBus device users are instructed to consult the device manufa=
cturer=E2=80=99s
product literature for the specifics of the device they are using.
"""

It's only supposed to have an effect on the power_good signal, not the
reset. I guess someone could wire that signal to a reset. Same could be
done with the alert or the fault one, I suppose

>
>> It is very similar to 'crit' or other limits in that sense,
>> I think. I don't really get why such property is not OK in hwmon then
>> and why it should not be configurable, if the other limits are ?
>>=20
>
> Its use is for hardware control, not monitoring, even if it may be connec=
ted
> to a status LED. MAX15301, for example, groups the command under "Voltage
> Sequencing Commands".
>
> On top of that, the voltages are value/hysteresis values. The "off" volta=
ge
> is lower than the "on" voltage.
>
> TPS25990 doesn't even support the command according to its datasheet, so =
I am
> at loss about your use case in the context of this patch series (the PGOO=
D pin
> on this chip signals to the downstream load that it is ok to draw
> power).

It does support GOOD_OFF, althought TI renamed the register to
VOUT_PGTH (Section 8.3.14.7.1.52, p87):

"""
VOUT_PGTH is a standard PMBus=C2=AE command for setting or reading an 8-bit
output voltage threshold at which Power Good (PGOOD) is be de-asserted.
"""

Same as the PMBus spec. Changing the value through this command does
affect the signal as intented. How the signal is depends on the
implementation. It just drives an LED on the EVM.

Anyway, I don't want to hold things on this. I'll drop it from the next ver=
sion.

>
> Guenter

--=20
Jerome

