Return-Path: <linux-hwmon+bounces-15207-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +nhZLgGrNGqPeQYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15207-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 04:35:45 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F7B6A3A13
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 04:35:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=NRRwoT6O;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15207-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15207-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A765A3001594
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 02:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27E12E6CB8;
	Fri, 19 Jun 2026 02:35:41 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91631E107;
	Fri, 19 Jun 2026 02:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781836541; cv=none; b=gHvyO0OnXCdUlyZtPyZnkFNMHtgMqqPUZpbJ7oPnZAVVqZohu9sxm0nxGduxeCW2j0FJpm2ytqHvSPOqVdaZIPWNHZJhb5BgwU99oBDtPi6fniS+XLu4ImC0roAh8vOzk+v5i3WU3yDgxJF06X/wZFY4PwAPmcYfeKdrBbq+aSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781836541; c=relaxed/simple;
	bh=ZGVLPwObCgP20uwMKRFB7Ql5vZia8ZWLTp5UfaMt9fM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pHyXv43yyEnWYKr3nLOfRr/xMvHdDkIhnYKd5exZH37MetlQChrwlalJhKLSY4Xr4G1F4IeZDjEOeQrp1h0IM8woqf0XoEak7BBXw5tYvtcqlEywjJpxEdup3I7GXtyTW9+4AJCShqPzLCXltq98yuCUZpGbDcpaTJaK3K5yGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=NRRwoT6O; arc=none smtp.client-ip=101.71.155.101
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42fc1acc2;
	Fri, 19 Jun 2026 10:30:22 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Question: OCC sensor_length validation in poll response parser
Date: Fri, 19 Jun 2026 10:30:19 +0800
Message-Id: <20260619023019.1064970-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eddb710cf03a1kunm4e1f4613ba788
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTRlIVkgeTBpJGB9DHRlPTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NRRwoT6OIADw1VHwrsOJCEPPKbN/hQjvmFhCPYnBu/dL37q3PlMRc+IopTYrMUDWmu3eCbFURxCDC7XEsqUZsLHAbjP0KOAsedFJkicJTEuEStI4CQ/QqulN64lnoSGKVvIH+gbmw+lWPKcJXfma/gnZQf79PiTPkDP93/ULGyU=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=RcBLat0XaZdU4hGS7ecNspeuwHYIBNlgVMZiOGIxL1g=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15207-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:eajames@linux.vnet.ibm.com,m:arnd@arndb.de,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24F7B6A3A13

Hi,

While doing follow-up review of the OCC hwmon response parser, I noticed
that occ_parse_poll_response() uses the firmware-provided sensor_length to
advance between sensor data blocks, but the later hwmon show callbacks
cast the saved sensor data pointer to fixed C structs such as
struct temp_sensor_10, struct power_sensor_a0, and struct caps_sensor_3.

That raises two questions before I send a patch.

First, should occ_parse_poll_response() check that the next sensor data
block header is still inside the response buffer before reading
block->header?  Today the loop advances to the next block and reads
block->header.num_sensors and block->header.sensor_length before checking
the accumulated size.

Second, is sensor_length expected to match exactly the record size used by
the driver for each known sensor type/version, or can OCC firmware report a
larger record length with reserved or future fields?  The show callbacks
currently index the data as fixed C structs, so a shorter sensor_length
looks unsafe, but I am not sure whether rejecting non-exact lengths would be
too strict for existing firmware.

The local fix I am considering is either:

  1. a narrow bounds fix that only validates the next block header and whole
     block before accepting the block; or

  2. a stricter fix that also rejects known type/version pairs whose
     sensor_length does not match the struct size used by the corresponding
     show callback.

Do you prefer the narrow parser-bounds fix first, or is strict
sensor_length validation also acceptable for OCC responses?

Thanks,
Runyu

