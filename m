Return-Path: <linux-hwmon+bounces-15417-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7wqbBmmYQmp2+QkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15417-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 18:08:09 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93F6DD226
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 18:08:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b+viujm6;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15417-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15417-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E70E43065347
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 15:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCCE3F7892;
	Mon, 29 Jun 2026 15:52:24 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886E037E300
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 15:52:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748344; cv=none; b=Zp7J4Nmr/7oArHl1R4o3fd7SjDzXFR2/6/A8vH3MlqTe78NHC+UsWAqgCxBXaKAwv1MmJa/mKM4742AYJbGanxYSvwQofVJslWdViv6A/7zAtb7o8lKlQZ8mpnKpl7s06pEQI/BdTtGdLUtAXeptlc25vcUiqjhpMPSrdTdqtP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748344; c=relaxed/simple;
	bh=cvcM/ZJkq9K5u+aJXpeMJwGY6cJYVvwJRXjmMiSt804=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEqlquhKvHdTpyZGkoNEymvM+aj4QmPLEfk3jebgAOYQLFwpOhz1hLWQFz+I0r1M809mZ9pJTZjYiVTl6gqW9ldDPwLbcEzhVJE+oUsL2q2zbbZ9X5kMzVVrorfC6KHMX+dxZulf3BljuZKsh7X6olGMwJSHMuL+NQdkRFYARZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+viujm6; arc=none smtp.client-ip=74.125.82.51
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-139b5e604b9so4095233c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748343; x=1783353143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIRBa4MmxxU4Y0T+DwH5Gv5lAJ/ryEEkU3ZF4zzK4Zw=;
        b=b+viujm6ijHfSLlo1lF8LS1vc4oaF3Ig/NVGNwp6RWb+S7rB43QkP7yuH88r+aQEYf
         sj9IPRWKaL5KQ98gNOZ37Wm0C+ZTjPO/HP8QRm6gzm94pO1ZfVZs1mz41jKYHmYiRWfb
         Tcjbp0MrBunbxn9AwhYmhisVczLo3kb2L3De7TfZK1/DwFzROpIKmv2fR/kYqi6yUAYa
         rr1HTmTzAjafNrtn0aRJYeObIVnqQuuqlNoK4w0a1bUxDSD4UlcT2mm2RNfOpithEp7p
         fHG6wR/+GIh9inYzv3T/28swOpYGXBd9VQRWgXkCOQQ8/HxprG2V45J0k3Xma69mm5SP
         3njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748343; x=1783353143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xIRBa4MmxxU4Y0T+DwH5Gv5lAJ/ryEEkU3ZF4zzK4Zw=;
        b=EvPCmz0VWfCWDggthef1KRqjYUSiqepBRmP7Lbt4hMeqignTlOr9/DdoOdU/yUKM+R
         tHutCvB2xAV2IxFqOKdgxf1O5RuZW6zglK75bcotXGwJld0bPIJc8S+aT8qJRPALSbmL
         QlCxDKXW4CWgCjLqM9KuGSEJ5ksq7gggCSdyfbJcZVYIdIHAcHyaHTOzEE9KKdT/f/+p
         Q9s3cxw04uaqcUx10Ls6Iktp+DdAqtUZpUUCLA1sy677XyLZ2WW/Ty+SXmDXp4U+QqF4
         qLtEAht3aFu9kUptIr6NQ2pQHPK9Hg4anBkJ5afqyVTNkNoMfWCMBMYRVy555hXKTFya
         du9w==
X-Forwarded-Encrypted: i=1; AHgh+RoPacOUg9fgCskVE6riS15/d7WnvgC2r6OwhzO+wDF2l5Y/xEgnPEWF3vjsH3tKSH7CiQ2wO4MJm72bXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3LuhssBMYT04Paqj9NwGDbVEBwZkLWW/ECdRvcDQZLwFmqmZ
	n/Fzt/5G6G43mR8aSFTPN1aKuz9IXdWSF4IemlWSGesCtbyAPcJCVKZM
X-Gm-Gg: AfdE7cnmAA7iXT566mNkXZrqqG0T6brsSxeIyi6dXiHdkMatr4SQcWId4U+7zEuv9t7
	viSN/zKu+XfidznRXM3AsWG3GZCK/w0jXZOw22nthz9Z9SOpWRoFsb3UyXf/1qrAtuK52KAOok6
	S/mUMl2+cwgqHXgZWHD3kJxHijFW7TbQYlUuKRCbx0gwmQFd2UM+K32IBtRlpubBlFtp7G9UmJH
	peGa+czt3o1+aesDxTs0kUiT0nopjzdNqpFRImCsqgCNOaQDTJMExh3se/4xn3rc9JKe3is+bbH
	KYQV0GQgwFjTK37PuldKT/aOulwVI5jpDsCGF4iGoxVDSv288YJxMO8l7lSIGXJz9BzmseU28pf
	31IsXJfYdG8oH95IdAyiQMtOYXWiw8d9ENOmLsEOt2o1bj/v4iHSNcc1dH2mKOo1Sc+LV+cbsA7
	314qtoXmBJZte3u32pqsk4YYxC5g==
X-Received: by 2002:a05:7300:3245:b0:30c:1865:d9f6 with SMTP id 5a478bee46e88-30ee11ad57emr77370eec.6.1782748342416;
        Mon, 29 Jun 2026 08:52:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c199561sm55887025eec.0.2026.06.29.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:52:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:52:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus_atk0110) Check package count before
 accessing element
Message-ID: <b75ac6ee-9d22-49a5-b6a1-fd98ab06ff24@roeck-us.net>
References: <20260619122746.721981-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619122746.721981-1-sammiee5311@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sammiee5311@gmail.com,m:kronos.it@gmail.com,m:jdelvare@suse.com,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:kronosit@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15417-lists,linux-hwmon=lfdr.de];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D93F6DD226

On Fri, Jun 19, 2026 at 09:27:46PM +0900, HyeongJun An wrote:
> atk_ec_present() walks the management group package returned by the GGRP
> ACPI method and, for each sub-package, reads its first element:
> 
> 	id = &obj->package.elements[0];
> 	if (id->type != ACPI_TYPE_INTEGER)
> 
> without checking that the sub-package is non-empty.  ACPICA allocates the
> element array with exactly package.count entries, so for a sub-package
> with a zero count this reads past the allocation.
> 
> The sibling function atk_debugfs_ggrp_open() performs the same access but
> skips empty packages with a package.count check first.  Add the same
> check to atk_ec_present() so a malformed firmware package cannot trigger
> an out-of-bounds read.
> 
> Fixes: 9e6eba610c2e ("hwmon: (asus_atk0110) Enable the EC")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied.

Thanks,
Guenter

