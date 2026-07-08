Return-Path: <linux-hwmon+bounces-15670-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1TNBI8guTmouEwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15670-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 13:04:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6C724A26
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 13:04:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ibwz4bf6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15670-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15670-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03C673028F5B
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Jul 2026 10:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6423D34B6;
	Wed,  8 Jul 2026 10:50:45 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8742E8E6;
	Wed,  8 Jul 2026 10:50:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507843; cv=none; b=L2V11kW1W2EfSQ6db4AQdE+esA078DLW40VC2tCFbxQCbncCRegLq0SZQzefavC69XNO+vvDbjrdmic2ozSzN4h8qnnXwdgJDIQD3VJ1wQFU9kQdqa9QcA6iWSQiCmXZC3kHyME9u5mW22VjtsWM98VHuijMCajX8+WupQv8NBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507843; c=relaxed/simple;
	bh=d032drDqky5KzDhvKMflWjg9LG7OfLWmPzgJ+fvrOpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO6b0aXiLuxtOWm0kjqyWxQc5cGoph4hmHDDVOKFZVKrV6anD/80e8UIPLNah9Ac2u1x4S/xM2lCrwYfm+tBs+QjMx3hbJV9P0NlflsevFxm9amuOAb87Ap68S9+ivNNA95KJId1hdcANuDe8wwTiQc3juFzeB0MpAucalwZZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ibwz4bf6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622321F00A3A;
	Wed,  8 Jul 2026 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507828;
	bh=d032drDqky5KzDhvKMflWjg9LG7OfLWmPzgJ+fvrOpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ibwz4bf6ZWdc2y3Uii8snfheqYLAQLkbL1qe9WkXw20toarMn87Z3LCNseS5ZXqn1
	 HOqq7eD8NTuCvbyDupIX9ZNM7IiIWIQjrj8pte9uTVS9yRFSLjCysvBN5BGbKGDJ1W
	 Wqb/cUU57RUHCS8qxdhx36hkU1iCb/ZY+DWZW6FiGmdhsajoKbVKPwjN2tdXV9zloE
	 iEAhLXY3EehifNDFYFBsUM1iqdzmLL6pG88CDLqL3Nqqf4FbL0ipI5aFjq8IE3l5Oi
	 EBMZSBOX90SG3TE4PLUlzPUL/ocIZiF8xGSn6Rrg5ruo8r5isMN4G7RDoCAkC9qiHx
	 ONJ8qjwzsulKg==
Date: Wed, 8 Jul 2026 12:50:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <20260708-true-carp-of-champagne-a0dcca@quoll>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ak4QO9uhKOt68dl1@nsa>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:noname.nuno@gmail.com,m:linux@roeck-us.net,m:fredchen.openbmc@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Jonathan.Cameron@huawei.com,m:wenswang@yeah.net,m:Frank.Li@nxp.com,m:chiang.brian@inventec.com,m:chou.cosmo@gmail.com,m:dixitparmar19@gmail.com,m:eajames@linux.ibm.com,m:apokusinski01@gmail.com,m:thorsten.blum@linux.dev,m:ashish.yadav@infineon.com,m:alexisczezar.torreno@analog.com,m:arif.syed@hpe.com,m:tomtsai764@gmail.com,m:abdurrahman@nexthop.ai,m:kimseer.paller@analog.com,m:u8813345@gmail.com,m:Yuxi.Wang@monolithicpower.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:nonamenuno@gmail.com,m:fredchenopenbmc@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:choucosmo@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15670-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,gmail.com,kernel.org,lwn.net,linuxfoundation.org,huawei.com,yeah.net,nxp.com,inventec.com,linux.ibm.com,linux.dev,infineon.com,analog.com,hpe.com,nexthop.ai,monolithicpower.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quoll:mid,analog.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20B6C724A26

On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno S=C3=A1 wrote:
> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > On 7/7/26 05:26, Fred Chen wrote:
> > > Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> > > multiphase voltage regulators with PMBus interfaces.
> > >=20
> > > Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> >=20
> > Please provide evidence that those chips actually exist.
> > Internet search comes up blank. I'll need confirmation
> > from someone at Analog.
>=20
> Hi Guenter,
>=20
> Well, in fact I'm in the middle of preparing a series that adds support
> for:
>=20
> "max20826"
> "max20855b"
> "max20908"
> "max20912"
> "max20916"
>=20
> All the above parts have the datasheet under NDA. But before we had a
> one page "datasheet" in analog.com but I guess that is gone! For context
> I mainly did the base (core) driver for max20826 and then Alexis added
> the other ones.
>=20
> Not sure how to proceed... I can wait and then work on top of what Fred
> has but this patch is very minimal when compared with what we have.
> Like:
>=20
> * No regulator support;
> * No direct mode. The chip has two ways to access registers (paging and
> * direct mode).
> * No way to count how many phases we have or if RAIL_B (func[1]) is being=
 used at
> all.
>=20
>=20
> Some other things more intriguing is that these chips, as far as I'm
> aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
> a gpio vout. Also we needed some special handling to read phase current
> which I'm not seeing in the driver. So I would like to understand how
> the chip was tested?
>=20
> Anyways, if Fred is ok with it I can just finish what I'm doing and send
> the patches. It would make sense to have something more complete on
> submission but I don't want to just "steal" the work already done.

Binding should be in such case posted complete, so probably not a
trivial device.

Best regards,
Krzysztof


