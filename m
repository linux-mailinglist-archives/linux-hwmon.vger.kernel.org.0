Return-Path: <linux-hwmon+bounces-15101-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3LUqBBmgL2oLDgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15101-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 08:47:53 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59618683EBA
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 08:47:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15101-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15101-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF335300DE3F
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 06:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0394F35E949;
	Mon, 15 Jun 2026 06:47:49 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19413AF644;
	Mon, 15 Jun 2026 06:47:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506068; cv=none; b=iPFLDfjyjCGnAjppTHQwntfTJFWXiqUhv3YBYdTccJGUa1BtjYgt2UlJAj+pJpF6KKnc7a1XYbP5Y18YPBrZq/2qkxytnL5STYjBs8Vib71cufzZtDiqp6XtvVajWHroNX8VwA44jlMkoXwksXZh9z06phlYlMOIx0zwv3uJdck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506068; c=relaxed/simple;
	bh=CpaT9jsgSRSWY/i8wt+qdETuCCWXVLqnTOpKWK7N7QE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5mWTLDOpwafIIZNrK8F5gQ9dSagtNJ5JLHShWJpOJBwzuBQGX3rWF6mdGruNM3X8l2+LHPCXWeQS0zPLQZFr9GY9zeJgD2fs/s/SkwU9BskI6U0OSIhwZSqbVeAPD61DauqAJA42pCAyFkqQtkGd2ikt58nURQy0phSzAtZ1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHx_oOoC9qm86TEw--.24613S2;
	Mon, 15 Jun 2026 14:47:42 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] hwmon: (w83627hf) remove VID sysfs files on error and remove
Date: Mon, 15 Jun 2026 14:47:31 +0800
Message-ID: <20260615064732.48113-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHx_oOoC9qm86TEw--.24613S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUJF1rKFW7Gr4kGr4kWFg_yoW8XFyxpF
	WkXFy5KwnxXr47Ww47Z3W5u3WFqr4fWa4aqr4fW34SgFyayrWDZ3s5GFyjyryrJF95CFWI
	q34rJry8CF9xGF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUym14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUa9akUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15101-lists,linux-hwmon=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59618683EBA

w83627hf_probe() creates cpu0_vid and vrm with device_create_file() when
VID information is available.

The error path and remove callback only remove the common and optional
attribute groups.  Those groups do not contain cpu0_vid or vrm, so the
files can remain after a later probe failure or after device removal
while their callbacks still expect live driver data.

Remove the standalone VID sysfs files from both the probe error path and
the remove callback.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/hwmon/w83627hf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index 95115d7b863e..bb993bb09f40 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -1823,6 +1823,8 @@ static int w83627hf_probe(struct platform_device *pdev)
 	return 0;
 
  error:
+	device_remove_file(dev, &dev_attr_vrm);
+	device_remove_file(dev, &dev_attr_cpu0_vid);
 	sysfs_remove_group(&dev->kobj, &w83627hf_group);
 	sysfs_remove_group(&dev->kobj, &w83627hf_group_opt);
 	return err;
@@ -1834,6 +1836,8 @@ static void w83627hf_remove(struct platform_device *pdev)
 
 	hwmon_device_unregister(data->hwmon_dev);
 
+	device_remove_file(&pdev->dev, &dev_attr_vrm);
+	device_remove_file(&pdev->dev, &dev_attr_cpu0_vid);
 	sysfs_remove_group(&pdev->dev.kobj, &w83627hf_group);
 	sysfs_remove_group(&pdev->dev.kobj, &w83627hf_group_opt);
 }
-- 
2.50.1 (Apple Git-155)


