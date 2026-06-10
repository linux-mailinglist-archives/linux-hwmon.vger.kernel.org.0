Return-Path: <linux-hwmon+bounces-14980-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E9P9MWjAKWr6cgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14980-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 21:52:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 213CD66C989
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 21:52:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nOAD7bbo;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14980-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14980-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99B4F30C2AEA
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 19:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397E6347BD7;
	Wed, 10 Jun 2026 19:51:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F51A6839
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 19:51:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121063; cv=none; b=E/4rORLFuo0biXFWpfn1nns8xJ7yIC7Z2Y7o/nWO0SOmyPqysbvOqnBvnIV4jp11xDm3vtCzmrayLwkMBqeTLvJEOAoQ1IrP18WE5duK2htr4UMwvpCoAJlGbv4AsGZfMnGJyETgnEVClonZRcNq58OfGFyHsYK/yZsxUopM2oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121063; c=relaxed/simple;
	bh=hUCfQs7KQV98K+RK8rpTrfjrb7Llur02mD4KOdXsaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehaZveS4y2c6JDnopT5ZNBdVB49Ky84FCkOe4IT7m8OUQVPg0riXDssI+MV2iUxqxdmbgy3CFWY7OPICSc7zuyKQywu+wLWbePO/v1PmSE8HiSG+Yh5hO4eZYfhgIO3/7JKSVhKYR6KLb4DrlxRa3S2736lbHNw4/zdEzotYc/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOAD7bbo; arc=none smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-307263ad0cbso10074834eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 12:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781121061; x=1781725861; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6nKOXSea2rAp540lVxyC9Nx0wjg3EWyE8ubZisJrsQ=;
        b=nOAD7bboDlIrQgVzT4pKY0SL5xGsbM2+UWT501fb7PveIDNw2jnT6zfGW7f0s7FZPd
         A4LmApSTC7myOEa9eDQk7JyGe06yTxkYQlDlccOT0elMv6nVi+fV5HryRmyUr2sjBbC5
         GRXJtdwZJqewCgPWIQ0LPPL/tb7mF2eqYnMMCafISvasv3on1fbIHEe++Ud3CEhYWBJq
         xsP5o8cSH5issK/kxz8uhLyphBLidx+GAFogusNgvCvLgfwQ4o2tVNzCX9e6oQFArOAo
         e+IPc31SSxt0O3ybtxP+3OilhE2F8k/0glvAAlcnicAEIDQbGMpRxUVTjEDBl2taF2uA
         J0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781121061; x=1781725861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6nKOXSea2rAp540lVxyC9Nx0wjg3EWyE8ubZisJrsQ=;
        b=k5NbSFofgjEM6jzzRmVcIcfBUe4SZxiAG7SQ8qEQinU7+P2qr9ubZs5JBSbLRVSRZB
         2UYndNeXcEeCqbDQ21gPCjZCQd5/b1Kv0qYU99RT2ume3SuF5QB3/TY/qOsAtB7QwjJA
         VQr41MIwGzfPWsOhV3KDkIJSA+m9/vPMfN4iz9hyjJ6EHdGk43gZ1sL3+xLSwFkksNTe
         6NOgpftSaDqTYmgon3uayTpOjrd4DHJ2x1T78dTc7NJDm4CPH3ZT4+kscRP2ZL0t83/E
         sFSTBsv4s0dIGbJqnNsoiyEVVlEwOu617Cp7rjwKCJ3KK7aWyKTWBDfpmqr19Mt3+2pl
         HK3A==
X-Forwarded-Encrypted: i=1; AFNElJ8BqA3D5MSvLBaeKOa7hhgbLE7tL56fCHXWEc22f6VhwJ1azxpuSdMVmPb0KUgR4mufI/baPA5oOMmNHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlG4dthlLcl9mDuPmPTQL/JsAG+bTqdCUt2NhOcTREBnQqQbk
	3ctjJ/zjd5U1KzVE/DGP1ndX4ZVLGLMOP9JSZpj/I3zdGbjgWHO5tXjl
X-Gm-Gg: Acq92OFCoebwB1UosKy12vEkEVI4sKoIodyWt43OUcHvX2mh8hz2u/jm+ou4/rgy3A2
	cF1RjAcfmMM1Ten3ogAAZngj3ynPllVujp5HOsIUc1ZtcGRN9oAOI0+Y/5Z0lSbbxr7kHJVQomO
	DKE50S/d9iO3ER8UayLel6/xIo8QknMiQ7QLNSyOYPV9/ex87wCKg/lpd4pKsK8qQFzPsh70npc
	if2eF3Rt3TAHx4upvCt+HNFS1Qa+mHV4jr2IuX9DVfMuKqHnGanzZ9niV9Sgb261ZL+ymCpK+zU
	P79IgLGs9ipXCTUpW3aWQXweDdWKaduQqTxvEruQFCHl/4n9LyM7liA+Dt+X6vIdsDKPJv9zEte
	WMPmpt0jAac52juzxZ6CUPt+xDlebKA6d/6F9RuItiIOkNcMhRAwp6cIO4yZcOjM1bFHi7geHlj
	KIW6XOmCbjymVuQ3zSN2v3X78nenxz4hl5Ca6+M8WEdFKtW70=
X-Received: by 2002:a05:7300:7313:b0:307:26a3:75d2 with SMTP id 5a478bee46e88-3077ae86b6emr15661380eec.7.1781121061194;
        Wed, 10 Jun 2026 12:51:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e8csm26791373eec.16.2026.06.10.12.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:51:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:50:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Latitude 7530 to fan control
 whitelist
Message-ID: <43b8b294-ceb8-4d30-9a6b-09aa836f7ff3@roeck-us.net>
References: <20260610180141.311503-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610180141.311503-1-W_Armin@gmx.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14980-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:pali@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,roeck-us.net:mid,roeck-us.net:from_mime,vger.kernel.org:from_smtp,gmx.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 213CD66C989

On Wed, Jun 10, 2026 at 08:01:41PM +0200, Armin Wolf wrote:
> A user reported that the Dell Latitude 7530 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter

