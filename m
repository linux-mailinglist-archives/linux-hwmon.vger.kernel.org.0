Return-Path: <linux-hwmon+bounces-15646-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9nFsHbWuTWpF8wEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15646-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 03:58:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAA720EF8
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 03:58:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AlVMc2OL;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15646-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15646-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64EF2300BBB8
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Jul 2026 01:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011943B14D4;
	Wed,  8 Jul 2026 01:58:11 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E73AF65F
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 01:58:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475890; cv=none; b=ZnY8hddAvW6p44+LFkCdl4KwvgDD7EGZ3gZkj9nlk27moeRIEqwvTwVEp0JD3WGzq0o0gHcQCoDaUtUr017S4z9XN/pKnPQ0tIYg4mAEtavuZTLC7PK7nSuAavGiTAp8s+rn0IAMBspzfggz2dEffP1VdE62ISlXfXgXfKRQTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475890; c=relaxed/simple;
	bh=WA01+3jNR25mXX6yJe3mUuFQDKJx1LrMeMzskaaaWKc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NJkJbF8Jg1LDEa6XY5nKcKZnhCz9KUPReA8jTVyj2vk6juVlQPoLNhB5jY4vTQoi/w2cdBD6ghox1kIeAmvlNjwYNMW5HTDkF8RnLDS62FVWarhBNZvuaWgxmamD+IEl6Ro5Uk5YgNaj95kSy+WmuJ5B3uX8UaXibx9G5KhM2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlVMc2OL; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381507c9380so125602a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 18:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783475889; x=1784080689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6ukoT6Qm4ErpkOloqFuaoVM0FkbddLKrHW5Ob6wAHU=;
        b=AlVMc2OLUR74ORkkq4l8ZW2sCpJa7Im0gouiKvmJxU4t22bxgXnBD0HdU1eJ5TqxEo
         ikqR/VwtPXB6ULlKgcohTq2Gr2EY5E/cGcsYYTX621VIavLX4AWfEyaUbPiu4Y9M5ac+
         xLJA5LAunA2D33BOy837WoFI8YxMuGlPNSt6hi5si/T7s1Nl7+F2xJBG9p/WeUylefCV
         fYiGyo5wmVOUaEkj/zYmDqLVYZtz0ldJIQFJXKgQynb8X62E9uhMQw0Yd3LS+d/cef1T
         /0Ezd7CALlJrdWrmKU0vcDCoqAhb4j0oU9VhNh50UHEIeZA+EuadoN0K5D5rtUwAuFdW
         iZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783475889; x=1784080689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6ukoT6Qm4ErpkOloqFuaoVM0FkbddLKrHW5Ob6wAHU=;
        b=V2/f18HdGMu0I22Spuk6o7X6AhsEM+Nbc1+1QsbRbuHzHyCx6L6d+XWr6I2Rt8H4kx
         TEfa43K73nacSnXsFZlyMFLevkvJNm715SErUGmqEyLhCjXvXWd0ujZPFcmV3cgyzsuR
         fC1GVfZYDCJcVfV9FN+1EZM8KAnYgocOgweW0JIQZE2f1/mDyuFDNXCf2OKc+IzM5fzd
         7G7uSELjZvOW7+ZXCq4Z4OpoOuWne0xu4q0/HdsJMgMMYOIesABTztaJOfIvG2bvLbM0
         +S2D0zGVGYossOFdbcoFqzHcaPzuTY/EN+vh/G0o4gT/ZOmvUauiFSk752qhbF6ozqXM
         qyrw==
X-Gm-Message-State: AOJu0Yz7/wDyJQ6zrSrv9S/a+VzUXBZN/ugW1fJlk/6fyOhv2UqYLSta
	fh/M18SC6Q12MrmjVdvL8wJ67IZUIlUW2BPnMI4/SiOa27OgrvLxBcDYLPpX0Q==
X-Gm-Gg: AfdE7cnC/21DPZcEKBiGQIvElLr2xqacV1Dhau1NT1fOEB5OQiI14OiYbNDJHuWUqGJ
	6DaQ1OUgN10RuEIhaWXt2/L01OgrEVJONUynz8b+DWcrEF487k116zjNpwZOMs94V2sMdGUEVUm
	YHMTKOqBagxJymA/4s7C6dzZBDfLUWByixyOIfhjpZ2B1lffO8ViTikbA6d1eNcgRMsIdVQNeu2
	DwMmNnV9YJ39Ujfl4pPU2ovewnDmWrgh15C0KFKu2ajkL0c8Mmj2Pe23fKBVUHhTI74TxTG8Wml
	4XvX7FTGzhewMTakHq4Zn0cFHxqbUaEgRbhc/VYLuykJu8T0le06QhTAyTz/8NVmI4QVRzqWlqd
	kAeh4qRy71xGqlhTQIdu03glUiGhQ+37mmVTGh3j/dZKpce8GamhVEqUH62Rm36RVv0LV4+mkIR
	o4CGdP5WPqzH6CeE5AjWfFyfICtw==
X-Received: by 2002:a17:90b:384e:b0:381:149:cf91 with SMTP id 98e67ed59e1d1-389415ed859mr419434a91.26.1783475888691;
        Tue, 07 Jul 2026 18:58:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm15120231eec.19.2026.07.07.18.58.07
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 18:58:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: [PATCH 0/4] Fix error handling in HID device probe functions
Date: Tue,  7 Jul 2026 18:58:02 -0700
Message-ID: <20260708015806.213790-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-15646-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AFAA720EF8

Calling hid_hw_stop() does not stop the device IO.
This results in a race condition between hid_input_report() and the point
immediately following the execution of hid_device_io_start() within
driver probe functions. If the probe operation fails after "io start"
has been initiated, this race condition will result in a UAF vulnerability.

Fix the problem by calling hid_device_io_stop() before calling
hid_hw_stop() in affected hardware monitoring drivers.

----------------------------------------------------------------
Guenter Roeck (4):
      hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop
      hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop
      hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop
      hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop

 drivers/hwmon/corsair-cpro.c        | 1 +
 drivers/hwmon/gigabyte_waterforce.c | 1 +
 drivers/hwmon/nzxt-kraken3.c        | 1 +
 drivers/hwmon/nzxt-smart2.c         | 1 +
 4 files changed, 4 insertions(+)

