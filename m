Return-Path: <linux-hwmon+bounces-15766-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0CpROUTnUGra8AIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15766-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 14:36:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4642B73AD3F
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 14:36:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=debian.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15766-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15766-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD333047067
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 12:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F552366826;
	Fri, 10 Jul 2026 12:32:48 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8394E4218B1
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 12:32:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686767; cv=none; b=KjWRWkzuM14cUxt6KTw9j9mYct19RWM9xfteP8IbVV6OEY7nOMeXpsBagS9QHA8vV6wc2CfOp1sNXumSrauSo871dIiZwTg1VBwwhctUU4XpzM41nSvPT2OCaYzEAMpRzP6Hsd2zSZoKr/OSgdLJeK8WQyp7Sd2kYvbL8FvC6rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686767; c=relaxed/simple;
	bh=6VYu5Ln2dGULSfG+3BTeihBgx8YyS2T+l9vLZX9vPfs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L2o36OV8UhHC61+WqeGfG2DWswbj+DNZuOWl8BK9OLUa7u4fCH9F6q7ovo6HfIwVsq3+FVj4jDrVQUUJXasvAETZkGFxS0zPjA3juH4z8QMCxCccUYJUVqsZfjrXePRiy/2mr4OVJ3yigN4HucpRc8Vt+t25U3aKVXx79uHTYxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84847482584so602705b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 05:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686762; x=1784291562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iG62tnW4pdhMeJbfpvvvkEJyUp5+t4TXXdqe5pWpdVg=;
        b=iIFLda+8KkUSz3b4NYYp3bwnjxX4h1MIh1njiqz1RkwnSXOfHaVBQ3jxZy3U+AzJQ4
         evPPjLozM6LxYZE0nT5kTY6gihmA5D+NNNcRpkRcEXw60XxxOfvqylQsrULCbNZBg5wj
         Naylfex2u4LY0axM1GKkGZvGdE8qeymz9iE0toiTOkui9wbeJH5bW0xJSWsZHOG1KlEK
         XMygVRjICywue13CbbsC0hRRjoZ0hxErqQDgS29A3kPWWx9+6I0rh2CFCbkKkyZj3rhV
         URyUs9IUOVK/DGmMU3X73v8csxRRpTx24SIOXOj7vwUkfKsPxddXuVCrFi0oXxlVIMx7
         LrIA==
X-Gm-Message-State: AOJu0YxB4ZbO3xH1q2x7Pd8zNqbgCZfgDeM6J+Rcq90S3YxDTt4YVKZT
	JNWyfXlrc6SJS77olfzW6BB7RgjHzFZKkIPBp49x0IgRNI2635f/ylqWJX9Q8Ec=
X-Gm-Gg: AfdE7cnIIv1DfzR28k7296l1vDXF9/MKD4KQYsDBRYrAeh/Hiq0o73LGfG1Gcmeygot
	pCI6ZobdTe1MPlMr2RaqHpe2wtWXawqWNx51V/JPUlsKh7WjOkvrgUnjgopDs2Cx+QxLQdlaEe+
	G9z3ZE+uZG8GkIPIsPjRyw+w80GC7zsazirXusxXZk/7ygOGeusw3FepfdGg4qc+jZfwc+xK/sj
	Jtpl1MeWljUaWlpapWPHimX+TNAFwDPVNNS8ZazetqI4+8509PioQlL0MYyw4EmdTuBYOEuPz8d
	qa2k31+eeIyIlab7/+OHn0CV/C0fD8p3g/W0jDgxiZMxD+CsMZ49V+t+ocMj/29na/Q/GW0iPQM
	HhA/V9GNNHGqHFpVJ/NGTgCDlPdFcX1NbUkv570STI/jA1iStE1nw4YeYksFug5OSv1GnFznYV4
	NHLEYOSb0QRtOh6/Cr7WGleGXh6a2jpZlwsyKyMkkNjIWK0Fvi8Rlr7fsi45GiF1igTjyCsr1ee
	KzkMIpdI2HZypeWAsvXlgPa4A==
X-Received: by 2002:a05:6a00:b8a:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-848703459d7mr3207122b3a.3.1783686762398;
        Fri, 10 Jul 2026 05:32:42 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-54-80.dynamic-ip.hinet.net. [61.228.54.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848686d6e86sm1929058b3a.19.2026.07.10.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:32:41 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH 0/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Fri, 10 Jul 2026 20:32:35 +0800
Message-Id: <20260710123236.10508-1-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[debian.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rydberg@bitmath.org,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fourdollars@debian.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[fourdollars@debian.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15766-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourdollars@debian.org,linux-hwmon@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4642B73AD3F

Hi Henrik and Guenter,

This patch converts the applesmc driver from using the deprecated
hwmon_device_register() function to the modern hwmon_device_register_with_info()
API. This silences the following deprecation warning from dmesg on load:

[   24.706091] applesmc: key=620 fan=0 temp=37 index=36 acc=0 lux=2 kbd=0
[   24.706270] applesmc applesmc.768: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().

Because the driver creates all its sysfs attributes dynamically on the platform
device, we define a minimal struct hwmon_chip_info with a single temperature
channel and implement a visibility callback that returns 0 (hidden) for it.

This satisfies the new API requirements while keeping all existing sysfs paths
and attributes completely unchanged under the platform device directory
(/sys/devices/platform/applesmc.768/), ensuring 100% backwards compatibility
with existing user-space fan control tools (such as mbpfan and macfanctld).

Shih-Yuan Lee (1):
  hwmon: (applesmc) Convert to hwmon_device_register_with_info

 drivers/hwmon/applesmc.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
2.39.5


