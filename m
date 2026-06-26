Return-Path: <linux-hwmon+bounces-15376-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xNzsDWhPPmoBDQkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15376-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 12:07:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29F6CBED0
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 12:07:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Htjfgtjl;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15376-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15376-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12401306A37E
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 10:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAF63EB0F4;
	Fri, 26 Jun 2026 10:06:02 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA318B0F;
	Fri, 26 Jun 2026 10:06:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468362; cv=none; b=MyiZEG2BSoqX4cDUY/6phkEkayiVQ/1yQ9CS7IG0JbSchWNh0Gtht0Wds6tvFDjHi5wo1O6uJ8ggPAyrBAS0tUfzVxfD+tK7nA1BWHYohORecEo6WKvLG9oIibN9NacpWS6QLlKwpLjugQvJgmJsYEAvtW6OtY+mNQQoST182Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468362; c=relaxed/simple;
	bh=rKmflEMbcMZIfVItGcgxoOJgLvnhrqPw2LKP5XZ6M/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkWDYZip+XVfuwUli7WzTy0B1c6v1rRknYJrIH/V3h3ntDSR3wfg6SasJKkP0nKOul2gOG/PzQjneMWXPJsCFLnS4YfhDugYv2UAGmk9xLl8RA+Ont8ogWCciVEZIPoGMy7TH4xvJhbU86rcJj/V03dDq4RVUtFqTQ2CIwXFnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Htjfgtjl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC391F00A3A;
	Fri, 26 Jun 2026 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782468361;
	bh=jcKh58iL8WIQzcHbsnUmBBybvD/z8aXyoKwE5jmOnqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HtjfgtjlM7MLRnsky5UjtpriqwNF7+wcettAJnB84XxsNRllXEmOPaqdSo3P8Khp0
	 Xt1cPeuTYrAw3+hniySXZJXtrJkIlVDO0JR72SJniQ2j/EF48SCsYmKkPTM8YpUGPF
	 u9XDrMBkTuxA/AJxMDinT25ToJ9ERYDEtcXqnYPTA/aS1/mgqKYaw/KaY1cWVHJ+w8
	 qhDwM/XtRRmxWRLTZmXp1isXXD1PaaxVwnfDI44YdOI964FAdePTuqB/oUKgqOhNuI
	 fT5Ui2hPNIiAI2qXkKn812koYbPO88oJZWlaY5+Aew8lhYYhfgsDq8USfY3IddhJWo
	 zL2wO5H8FR0Jw==
Date: Fri, 26 Jun 2026 12:05:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: chipcap2: Add label property
Message-ID: <20260626-prodigious-rottweiler-of-tolerance-cbeedb@quoll>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625160423.17882-1-flaviu.nistor@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-15376-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:flaviu.nistor@gmail.com,m:linux@roeck-us.net,m:javier.carrasco.cruz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:flaviunistor@gmail.com,m:javiercarrascocruz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[roeck-us.net,gmail.com,kernel.org,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E29F6CBED0

On Thu, Jun 25, 2026 at 07:04:22PM +0300, Flaviu Nistor wrote:
> Add support for an optional label property similar to other hwmon devices.
> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
> distinct names to each instance.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - Implement suggestion from Javier Carrasco as proposed by Krzysztof Kozlowski.
> - Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.nistor@gmail.com/
> 
>  .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


