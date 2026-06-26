Return-Path: <linux-hwmon+bounces-15378-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ITCfF5ehPmp6JQkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15378-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 17:58:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E299F6CEBAE
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 17:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RCRFkOhn;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15378-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15378-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B2B83008273
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 15:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119C23E2AB7;
	Fri, 26 Jun 2026 15:58:13 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB4197A7D;
	Fri, 26 Jun 2026 15:58:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489492; cv=none; b=XcHPwWEeuTWfHW/69PKv1GhVk/FTllNFgIz0U0+P4pSDsQy8vtuyo+0GolMwUzyDzb8oCkaLNJsNWxXveQC1NEgChEWQiNeLlYZoS6Sxvv20OP58S9Tv47WJYfij4BZSy77CQ+U1230OgKJ4JZTSs0i4pIse6gvw0/2QCAZhEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489492; c=relaxed/simple;
	bh=ymf3FOIcf52a9TFTCpmPCM1+wemED8VnRlwLGS90/kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s95RIl2pup8yRIBbTeRROC6SjgVuGNyuTjLQkzKcw+CJAVXYJYZWn4xuldLLGg3aSuH8C+bqffp5iM5kiz3F3CKwoER1h0vpcDOjkhs+0HRCT1ipVz+UImhdUg3bbWt7IFor5VEUZKEhRBi6y9IScAjSdtKJqsocBxWehzPVd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCRFkOhn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADD31F000E9;
	Fri, 26 Jun 2026 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782489491;
	bh=ymf3FOIcf52a9TFTCpmPCM1+wemED8VnRlwLGS90/kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RCRFkOhnowwx2y/atLdS8QLo4O7S3J0AhMvmVWurQswYfz79vAp5l1HqAyxGiTi+S
	 fCo1YpftNwhLf7mANb0W7CxrRz0NQqA9TCHX0BxxjRIOBMq26WoK30wcKUMNOPZJ+l
	 ULy7A5YXNyLpYj5c+gyy2eOCxXlvtpLfDBuDwO9zvS4JLCcGEI0BkYoSWHIFEMTyii
	 d3inOEckPc6dxVXj11WZE+oC2dGBx7mFyP/t/TJ2BW3Cmw3T+j72WQUJiIZqMLSp/s
	 djWHjTr+h3oKlhbDfQiezor1jL/rAfuOgBfQjNAkpdWBknNB8APyIaruHRhCBnXi48
	 Y2U1ZUueSVmAA==
Date: Fri, 26 Jun 2026 16:58:06 +0100
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
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
Message-ID: <20260626-roundish-grievous-f3b39f640326@spud>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVC28uf/wP5JRN7e"
Content-Disposition: inline
In-Reply-To: <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:vasileios.amoiridis@cern.ch,m:kimseer.paller@analog.com,m:tomtsai764@gmail.com,m:chris.packham@alliedtelesis.co.nz,m:robert.coulson@ericsson.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15378-lists,linux-hwmon=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,roeck-us.net,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,cern.ch,analog.com,gmail.com,alliedtelesis.co.nz,ericsson.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E299F6CEBAE


--SVC28uf/wP5JRN7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SVC28uf/wP5JRN7e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6hjgAKCRB4tDGHoIJi
0glXAP9OL2VeUZrRfSRVN5xODRkdi1MZHnPu/UC6PtnS1Fah6wEAs0WUvkHzPfbc
7+IwMlgHd8XdRn+xjdfPrykFX6zaqwo=
=OjYs
-----END PGP SIGNATURE-----

--SVC28uf/wP5JRN7e--

