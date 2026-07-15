Return-Path: <linux-hwmon+bounces-15911-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kns6A4IhV2rLFgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15911-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 07:58:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06375ACAF
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 07:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ndZDDIyn;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15911-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15911-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7CB53036BE9
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 05:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6A73B8D76;
	Wed, 15 Jul 2026 05:57:57 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73242BC34;
	Wed, 15 Jul 2026 05:57:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095077; cv=none; b=jgVozBkpTY2K3x4HXQzLNlpq4Af/B1CqipH6C6SczHdpeku3qdTkhyh01bde5/busuEt0m634nZJ6bJwVZMNVrbD6ehfTaDbnHRpLWp+j/DTEBei+hm4jAZK2MZZ2DkzokJFpwNDei2oDSMzwqPpIn38Bj/9rHYA4ZvphE7N1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095077; c=relaxed/simple;
	bh=LUXYr2BEt6lg0VUZjSOzmcJbv0iAi9kIXKiwtQOsYIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2n1o9VxCYgHHtF7ExaS24bqlamZccTwj5Ch6BCXOoEypLpXkVpmVDORf+Mg8em7FvaNl37QoxGfg5t4eFYeSR+Haw7T7VabOx10v3YN3pqDfWl3AG+CmcdP3I3mo1g+OwVR6/Ord/sJMnWnGXx97cQUnVWYPwPY3ojyPCZxi6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndZDDIyn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38361F000E9;
	Wed, 15 Jul 2026 05:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095074;
	bh=orFyLvQLl8Saq4bd7BnHZEcBY5GU646cOzMnRrc0st0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndZDDIyn7juc6Fw15RmmjYRdCe5BmrLo2L10z2jVOLWyTEYrgB2rF6D1Ieg1YzRDj
	 /QgI3bGnCafhchZqZ6ySlllrmAwDYcUNWz0ESx3fgByJIDf90+A6pmkl/5uZtHj6Sx
	 GoKGqbYgcFR0va6r0PQ8JIZteHykpjae9I9twCbVkYdXGZbidqrgVW2Bvby6jAGJK0
	 qscCbMRHTBRzUbvHfMP51gQ0C6ZDpOUcED1RnmpcsJO0ctXuDGkFeJFxZXYilXva4S
	 zfvrZkT8f2rCgaPnm7bkRzJcaArNJhs0bqHzfVUzXXqUu7bxW3vDuSzAFZ6BDfFiDH
	 0UA3Ji1Pycf9Q==
Date: Wed, 15 Jul 2026 07:57:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260715-hasty-crafty-marmoset-86d08a@quoll>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zaixiang.xu.dev@gmail.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:zaixiangxudev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-15911-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE06375ACAF

On Mon, Jul 13, 2026 at 03:45:57PM +0800, Zaixiang Xu wrote:
> Add a YAML devicetree binding for the Sensirion SHT3x/STS3x sensor
> family and the compatible GXCAS GXHT30, with the ALERT interrupt,
> nRESET GPIO and VDD supply as optional properties.
> 
> The SHT30, SHT31, SHT35 and SHT85 measure humidity and temperature
> and differ only in accuracy and packaging, while the STS30, STS31,
> STS32 and STS35 are temperature-only parts. Within each group the
> parts share the same software interface, so model them with a
> fallback to the base part of their group: "sensirion,sht30" for the
> SHT parts and "sensirion,sts30" for the STS parts.
> 
> The GXCAS GXHT30 is a drop-in replacement for the SHT30 and uses it
> as fallback as well.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  .../bindings/hwmon/sensirion,sht30.yaml       | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


