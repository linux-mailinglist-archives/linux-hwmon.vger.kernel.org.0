Return-Path: <linux-hwmon+bounces-2739-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5090E0FF
	for <lists+linux-hwmon@lfdr.de>; Wed, 19 Jun 2024 02:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 788311F2369A
	for <lists+linux-hwmon@lfdr.de>; Wed, 19 Jun 2024 00:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3E4193;
	Wed, 19 Jun 2024 00:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="tEOTn56G"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC0B17F6;
	Wed, 19 Jun 2024 00:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718758224; cv=none; b=Dovl2mA3Szfm32wRe9lDlloOoPoyQ/dVK47tjTi12qdowWg8MVIp0UbxgfEpxE+ks9RjSJ8rJFJdGmBQocXAVr8+7QUEKaiepUh6XI0DSpgYHxoqa9JBQMGu/yEwqDfP/r29Hz8CrR0dgVXAx1trM0dXux5x/HvQQ+X9B2/zqF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718758224; c=relaxed/simple;
	bh=gJHykoxhruWZ9VRmQ4LSVMAFqKk8F0fIyG/UjLlo9vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbP2ntS4MDFSgMklE/lRqFMcfHwwGvg7udhb+EURQMlLS+SGKAAk7WQDdrIA1s1ES3mDBXmIRfVjhy7cv+ibzH3CxqsMiyMEeXk7s6vjOJGKEveik1Mx4nMZzsKsH857hBY9iSNgBl/uNeVT2+Eicval6tLhTAg12qq7izOdzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=tEOTn56G; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718758212;
	bh=gJHykoxhruWZ9VRmQ4LSVMAFqKk8F0fIyG/UjLlo9vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEOTn56GFTxjiojADyzqu/wqeQ0u5sRrzoBWHFRv2cNqO1gnjSL4cc7T9MyuwWoSP
	 gtMvIeppAzVPXOrRYfYGuVOswAaospQ/GtV2cs4UnQqxbzVaEsxcIVfZcBqWJbQyUl
	 OANH0JWohTcC3lYqRTceQMTiY/FNnFM6Ex8G2ELI=
Date: Wed, 19 Jun 2024 02:50:11 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Armin Wolf <W_Armin@gmx.de>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	=?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, Stephen Horvath <s.horvath@outlook.com.au>, 
	Sasha Kozachuk <skozachuk@google.com>, John Hamrick <johnham@google.com>, 
	Chris Sarra <chrissarra@google.com>, linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [RFT PATCH v2 2/3] hwmon: (spd5118) Use spd5118 specific
 read/write operations
Message-ID: <0b8ae7fa-e3d3-4d31-9b4b-657b15c2d19c@t-8ch.de>
References: <20240618195348.1670547-1-linux@roeck-us.net>
 <20240618195348.1670547-3-linux@roeck-us.net>
 <a7f208df-4c9e-4fa2-9d17-80895db51182@molgen.mpg.de>
 <661def21-b0a9-49c1-937e-8526008f529c@roeck-us.net>
 <omsjeb6zbkcdhh4a3urjdrdeyj2kczb734tbhxwdcvngzlm7pe@dzdphvmm6asq>
 <4755d088-7eab-47ca-923c-db1fdf3611ab@gmx.de>
 <6845cc2d-c50b-415b-af49-bf57333ee939@molgen.mpg.de>
 <f437519f-97c3-4811-ac04-0695a27d9b37@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f437519f-97c3-4811-ac04-0695a27d9b37@roeck-us.net>

On 2024-06-18 17:23:44+0000, Guenter Roeck wrote:
> On 6/18/24 16:39, Paul Menzel wrote:
> > [Cc: +Heiner]
> > 
> > 
> > Dear Armin,
> > 
> > 
> > Am 19.06.24 um 01:28 schrieb Armin Wolf:
> > > Am 19.06.24 um 00:28 schrieb Wolfram Sang:
> > > 
> > > > > to 86 degrees C. If that doesn't work, we'll be really out of luck
> > > > > with that controller (or at least I don't have an idea what else to try).
> > > > 
> > > > Try CCing Heiner Kallweit for ideas about the i801 controller.
> > 
> > > i am not Heiner Kallweit, but i found something interesting in
> > > commit ba9ad2af7019 ("i2c: i801: Fix I2C Block Read on 8-Series/C220 and later").
> > > 
> > > Basically, it seems that the i802 i2c controller indeed features a SPD write disable bit which blocks all writes for slave addresses 0x50-0x57.
> > > 
> > > Does the i801 i2c controller driver print something like "SPD Write Disable is set" during boot?
> > 
> > Nice find. Yes, it does:
> > 
> 
> Yes, definitely. I didn't have any recent datasheets, so I missed that flag.
> Oh well :-(.
> 
> >      [    5.462605] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> >      [    5.468399] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> > 
> 
> Bummer. That explains the problem. It means that the BIOS effectively
> blocks reading the eeprom on your system (because that would require writing
> the page register), as well as changing temperature limits. That is really
> annoying, but there is nothing we can do about it. Maybe the BIOS has a
> configuration flag to enable or disable write protect, but I doubt it.

What about using 16bit addressing mode?

    Alternatively, at initial power on, the host can set the Table 112, “MR11” [3] = ‘1’ to address the entire 1024 bytes of
    non-volatile memory with 2 bytes of address and hence not required to go through page selection to address entire
    non-volatile memory.

regmap-i2c allows 16bit addresses when I2C_FUNC_SMBUS_I2C_BLOCK is supported,
which to me looks like it should be the case on i801 for ICH5.

piix4 doesn't though.

> I'll drop this patch from the series.
> 
> Thanks,
> Guenter
> 

