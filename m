Return-Path: <linux-hwmon+bounces-15167-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kYaGBC52MWqyjwUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15167-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 18:13:34 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B590691D30
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 18:13:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FlZnatzG;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15167-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15167-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03E1D305F3B5
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 15:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477C944D03B;
	Tue, 16 Jun 2026 15:54:27 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB737C912;
	Tue, 16 Jun 2026 15:54:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625267; cv=none; b=ZWVkP2EtG7z1jeXeGZpAct/AwLkQJKIjO5pD8BO+J1biYnzitJyrlLD1THrwpczFP+UqGB6oAB7LIsdH3RM5Th7ZFQ6TjvgaEW3/6WPJ6ucU4pF8vJrMdSq/n7KPdLqZ5ICiAQI70wlktSU2wE7Ww/nmwxP52IaFHXuehvBPLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625267; c=relaxed/simple;
	bh=QBjVo2zzn1Kn7IGgiO7mxSw2ZUJvQWD1odSvlENLqsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIJ9tljdWAvHlFYB6ho0owJVqCdAoi6tYrpQjxnQVo+FDunRNpHkYX8XEXSWrwxn9YemV6kgtO0hXMtnlV46+qzJ1d+64HZMSoSqf3yKCF5IoxJTILkHK3uk790G+i8CNCjDCMkk6/6eRVtLFcPgLdvRBrzQY7RTJ6G0FNNkkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlZnatzG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472161F00A3A;
	Tue, 16 Jun 2026 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781625266;
	bh=QBjVo2zzn1Kn7IGgiO7mxSw2ZUJvQWD1odSvlENLqsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FlZnatzGdCrMlHJbb+GpNWCeVvAEeeC/c9XoMO5xpXUky3VN4XloFbpON3+NaQS3f
	 XBn5j+tZ3owI66oV2Weteg/BpDnj69hLWE6eHYaJPBCclKuuP+JMr6EWO1UIXHXVuf
	 Ygqh1C1iX27mGV6X3ARAVF2nx3Y8DjqD5sem4EJa7ZkIaiN1kg7tSJgNsEoh0srAwj
	 s9qcRq+37qM2qyvcA7VkFikamycoH7bUWpi0kyw7PlEa1T4FAtODh2B+RkDDSlu8Xv
	 00t63bM0LoZaoXlfv5cIlVgy10qPnK/HFNh9Tr5CKnvHe3+FpMsuxou+wfdkPXex0n
	 T/2oxiujkwxAQ==
Date: Tue, 16 Jun 2026 16:54:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	ChiShih Tsai <tomtsai764@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: adm1275: ROHM BD12790 hot-swap
 controller
Message-ID: <20260616-evident-cactus-206a56be1a3a@spud>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GN06vLtt+WHGTz46"
Content-Disposition: inline
In-Reply-To: <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:kimseer.paller@analog.com,m:cedricjustine.encarnacion@analog.com,m:chris.packham@alliedtelesis.co.nz,m:Yuxi.Wang@monolithicpower.com,m:hsu.yungteng@gmail.com,m:tomtsai764@gmail.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hsuyungteng@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15167-lists,linux-hwmon=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,roeck-us.net,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,analog.com,alliedtelesis.co.nz,monolithicpower.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,microchip.com:email,vger.kernel.org:from_smtp,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B590691D30


--GN06vLtt+WHGTz46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--GN06vLtt+WHGTz46
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFxrAAKCRB4tDGHoIJi
0g0UAQCxBb9zT7Q/M3t88hubq/v0Sx42Phn9fxE8y3D5/zP6FwD/fF75pHKXAdCS
PBgg5vF1HnKLx6b07G/pGgm3aFy+xQk=
=7KBU
-----END PGP SIGNATURE-----

--GN06vLtt+WHGTz46--

