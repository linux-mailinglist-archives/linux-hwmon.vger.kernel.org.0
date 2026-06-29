Return-Path: <linux-hwmon+bounces-15429-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQzXDVrXQmp5EQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15429-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:36:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF06DEAA7
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:36:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ik3ozHSZ;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15429-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15429-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45CB93001A6C
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 20:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC0D35E925;
	Mon, 29 Jun 2026 20:36:35 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6A6332EB1
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:36:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765395; cv=none; b=lPlkuhcmscZCrXlkEuWPCiEjK5N327pt7T3jbNl+L3WLMgfFfHPYbH0lJgK9iOwfMDQ+KnId/V/jRc04pjvQKCsedYuT8BptAnRzfdrnMI4jb5gaUUgCVXzNZTBE8aXUiQO9pqZclWF6cFoxzoaxFZO/WlfjyLrMFUE6u2pwBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765395; c=relaxed/simple;
	bh=HEP+DiC6jQvELx3nn04legxg8fd4z2J1ikTtQxw4O0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3qOJ0+o694T/uGBKe458ZS7Cg3+kY/4nwWdykGRjIAcuonrtPIXLZEs/el2GiDiclvQOkWI7KBdw6EeQoHlm801E6K+oKjcPcMjFGCWEH503MJT3+dGm+rAiy9x4tG2pYwOZ5fZDYnHAAkZVTcaPt5JLTphpXABuqbBhzqnVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ik3ozHSZ; arc=none smtp.client-ip=74.125.82.41
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13809223fd4so4598941c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765393; x=1783370193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6RMQ3j2//CIsXFskysCb9hJcebpr5nsrI9QdnpxDDQ=;
        b=Ik3ozHSZOeTq3LLdycJDKIVE+rf9PgHzu/q9Q3W9eWo22cQ3OYcuteCRS4LBxcGA0P
         Pq7IOBP6RWSENlalM2IG3Ia57SbXNAJxIIaPD5LZ1HsinNRWSGOiRr5qXdxrwokZlc66
         QRMPyqZWP4Q2q43/Jl+9MeAgdggWExGKyEati/gltBegjvmliC6JT3kFgNwzmuGZGnWu
         QfcVsYGWpXx0IyX/i1AZhoQ2qChYiaw93fhSdGIwuh5EJ+9MfxsesXxcPdUuBfK5b8yU
         CIQNeu7G8EBuAw/sx64JHSejAme7eRTT4DXcA8mx/mxdmMZuylhlfiYAiLA2cUQdir+w
         vwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765393; x=1783370193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6RMQ3j2//CIsXFskysCb9hJcebpr5nsrI9QdnpxDDQ=;
        b=lmSL+xVVsl4oWdvMdvYZP5/FWylbJURICRPMDulgOCKMzpfxrAoQdbYjx5nWeJp76L
         utHZtfd+zSUfH4i41GnAnyPPuABYAgjq3njhBiCUTSdMUPK8JWD2YqDvmc1WaXSlsJgm
         AnQCtqccfDpMaVRNX1d2mpOYWTXVwlzkghoWEI1UTCwzFMR3JELQSJIbph6JXpy/cjnX
         JehNMHBCTCxLD7WGOo5qgDDdvtexPW6N/umh0yHEGF1JYoVK6gsPzZAw9NcHagZAoihc
         qMerEy/YTSFsyUmQubUWu6UcrnzXVudnxhrbgnVE98GqBaqIft8np7MLZMRZ496b1rZY
         9ROQ==
X-Forwarded-Encrypted: i=1; AFNElJ81u36tfEDUKgh9csh5eaw8sKTQJDVOwvSfq1oiwpt6co0L91qOnxYMpVShIyWxPesk/SiAOQtSJksVGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVc+u9UXViTD0/gfkeGW7uadgpzIMin4sHd/ryS1MvBa+PFlFq
	ga0Gj1v4DmMrF7+myUhynJ24yf2G4zsBJPMCZjVYvrjR+Hs0FuQ9BVE2+a2F8Q==
X-Gm-Gg: AfdE7ckKhAQvGnY2L06XOe66N94Q119TyYmRdTE317qsr7AgVzEGnxXD/IXjKwU+8fx
	nawSd+27/evypk7gAzlP5FyNYZMLI0UXMHr9D9g6yUyLFpvPkqOirRGb9dhgWqm4Q0BQpt2YX+O
	WOu+wct/x9rY85+GjfvOv+11YAGkRwDcUK1fa8f2LAa0R4KNSeufQHKPhWJcGzIRT2J1kKcrWUx
	ufAi2fDopxreFPjrMFEJvErl1vyGf1zemBVoRonFIVs4m59MY3zGpZn4aFZu3t9gWmfCdc8VHQH
	pb/CQDOtGjJQHoYxRiELw+jGiEFdcJ8QDbSZy/furGf6mjtEQlAlAwczo+zwuBtnjjWzIztRc/A
	HZhjqOqTHV8aXtCT4G0XQq9TocGR2TFN/g7tDBtIhsRbk98JjQ+5Gs/nFHUHeRSPfs7/Gq60PSf
	Vp2oF1PcRIfCrBuc3i8c0eXQILQseOG5iaBS6k
X-Received: by 2002:a05:701a:c950:b0:139:ed5d:5ca7 with SMTP id a92af1059eb24-13b2a1ccae3mr523917c88.48.1782765393315;
        Mon, 29 Jun 2026 13:36:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab21932sm845147c88.5.2026.06.29.13.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:36:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:36:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (ltc2992) add missing 'select REGMAP_I2C' to
 Kconfig
Message-ID: <9945a3de-6f5a-442b-abfc-b32df3d40771@roeck-us.net>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-2-8104df929b1a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-add-kconfig-deps-v1-2-8104df929b1a@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15429-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joshua.crofts1@gmail.com,m:tzungbi@kernel.org,m:alexandru.tachici@analog.com,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:joshuacrofts1@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,roeck-us.net:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DF06DEAA7

On Mon, Jun 29, 2026 at 09:17:40PM +0200, Joshua Crofts wrote:
> The Kconfig entry for the LTC2992 sensor doesn't contain a
> `select REGMAP_I2C` parameter, causing build failures if regmap
> isn't selected previously during the build process.
> 
> Fixes: b0bd407e94b0 ("hwmon: (ltc2992) Add support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Applied.

Thanks,
Guenter

