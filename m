Return-Path: <linux-hwmon+bounces-15012-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OuhsIWBHKmqFlgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15012-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 07:28:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C74FA66E8E7
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 07:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Rl6MMXtj;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15012-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15012-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7139633D71CA
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 05:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BAD314D1A;
	Thu, 11 Jun 2026 05:08:44 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FC1372052
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 05:08:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154524; cv=none; b=U/05fAZ41aGfVXWebZ0bQ1KIHWPrtdHhirzzzeTgyHYUdV3hm21EzCggMSdlfiMcaNJk0MMF72GWTWK0f01StXZictvXxORuhTSg49umL50giZAMRsKlKFfDHGwlfkwGCsiIoqusFy1pDEhzfH3SgJYx/PEKI13O3i0AVosh9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154524; c=relaxed/simple;
	bh=RpCJqOkiv1DLPrXO2op820j5d34x1aL3ItTtqyK2uIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4riP0N4SdBR7FXlMFsEkfpIoF//rmRbvx882S5ZIed9mlJTYOUWEI7dVRXHYGgqWdZ88NSMAfC4erMaV33jJRbrskrckyrSC6VnSHK993qrQRIOzeovomJMTvWMLMcHvtJy9rl00KEK8X5B6eoS+jRWfrqush6444D27Bdvhu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rl6MMXtj; arc=none smtp.client-ip=74.125.82.53
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-138129a622dso260413c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 22:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781154516; x=1781759316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8/LBM2ge9TbM3J9QaUuiG08J7fVuFMBLdE+TcGBJNo=;
        b=Rl6MMXtjXJUogyYodzMLrwqFXOTrNdBOXQLAe3vm0oMZtqJvosmEO3FloqrZK0tFNr
         Gs5oWkCttgC4uhNVyacDRlFWJGZFFDDz7Y9jzd6LVKSnso1WeH/J5vyMcZyGGu0unszC
         8VY8r8vAE1qxUGeDQQL8LQthUPUfdvjBOg8glsX91BKMAv3j8O/DnMCXdO5c4hWcN7u0
         KljBPwJWmcL7UXkAfeq4AFEQGBZ66dOHw88rL9HvPFwegH+RQfy4ajbNujcOOrDeaDzG
         xXUVwqqzXFjxA0UVe64Z2of+dfYW6R/2NCLMIJXBYKMzFutfs+AM8Rlts7PHC0Mb4k9J
         8urA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154516; x=1781759316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8/LBM2ge9TbM3J9QaUuiG08J7fVuFMBLdE+TcGBJNo=;
        b=NKVZQ7LZZ6m37FZ35Ye2yjTIJG4IG8EF3tv5/hky4v40HjMVF85B9VL2JK1EQD+8Pa
         BAWTiDfwvUDftbMWNBgYuFRwGqjTfCJtCnF1aRkkseOWJK3n/KDxaHUziJX+YQHRgvEg
         eiiUEbG0KyeeSeVIkMwOXpg4iVA6CPpOvmdM28WpddMR5ToRhqQrQpqtnYNvF43I/T2a
         8s2lNnRzH5nhhkDMHrpdtQrlaeX7wWyPvoCmhnq1VRorgl/VShwUCWt452BzbCbDBq83
         9G2/fa5pVSbneyL0HWRP6SyQN/s3QzY/0vLuzo5ZCjuKcoWchZ0ZKEtcFrsHyR8hOVRa
         mRFg==
X-Gm-Message-State: AOJu0YyxDFQF/cSGn8v7Qw6Xvu2coJsK1faexgbOCF3eqGfJWCuyKT5+
	++VD1gGRU1kLehh1HaDnVYJU2WbDxwXWks82sjHgwDXlXfaXcaIMzohVA4DsSmxz
X-Gm-Gg: Acq92OHH6WeDqcSJP1XKvxPVfwgXO//5d1tO2DS2VjdUF8PtLsKhnPgK1MPkoRW8yCY
	x8SmyhV7jdTws4NIUe+Re/C3X2OuF182J88Qxnw7RQoFLMeD2NX+474y/7spUY7c7gWSUV3plZD
	3/j/vwlbTfTVPBsVZps9fCAaubAnJsWLsorRubAbnBBHtDN0AYDm2cKIKiWAn9HG5nfy0Bhjmhq
	n2be9yXSCBcRdjLh1IS+VvAWvH64yL5jIYW0cZQNIz5NXCvVrSHRojaJEYPMEpfH/yKmi5YPR+v
	98h6qgjhEJF0h+IkWISP5jMEHTQ3yJtg4mAzGDU5Gj747saFUCzret/Rx1tNLCppRF/kJDdjbh1
	Dp5rPpvBsfi8bjetqDei4XEHk091QjygVSOIAUw+XCW8Pv0nw62N4FFV/SsGEdzPKXsKidS7WcQ
	TFliR07bwMFWXolMdarArpfEn0lVVPq5+ATt0LOT/HAB2kYDSyaLQ6rJyM6w==
X-Received: by 2002:a05:7022:6b95:b0:134:d708:1a24 with SMTP id a92af1059eb24-138422ddd8cmr852314c88.17.1781154515589;
        Wed, 10 Jun 2026 22:08:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13842fa6ebbsm762743c88.7.2026.06.10.22.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:08:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 22:08:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	cryolitia@uniontech.com
Subject: Re: [PATCH v2] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
Message-ID: <66170757-4959-426a-ad97-c85cf647c492@roeck-us.net>
References: <1c2ffa0d832ae3a74f6d4ffa7cc7b7e6cced69e3.1781138459.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c2ffa0d832ae3a74f6d4ffa7cc7b7e6cced69e3.1781138459.git.xiaopei01@kylinos.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15012-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cryolitia@uniontech.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C74FA66E8E7

On Thu, Jun 11, 2026 at 08:44:14AM +0800, Pei Xiao wrote:
> The EC firmware is expected to return values in [1, pwm_max]. A read of 0
> is illegal and would cause underflow in the conversion formula. Explicitly
> check for 0 and return -EIO.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter

