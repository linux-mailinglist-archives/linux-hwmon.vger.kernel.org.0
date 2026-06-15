Return-Path: <linux-hwmon+bounces-15102-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VW3wGUWgL2obDgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15102-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 08:48:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720F683EC5
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 08:48:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15102-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15102-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A87830028C9
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 06:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273ED2FDC27;
	Mon, 15 Jun 2026 06:48:32 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC31212566;
	Mon, 15 Jun 2026 06:48:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506112; cv=none; b=t6xmuRZfQWrK5MUFEs6goZ6YkAtvZrYsQWXeeKT8xRvIaP9FL9f5MYmLAId3727NcTjVSlu7+HYRgdqTNbeIiwjAJfycK/DTBWsqB0nmkdpAyWbU6r7qzsnPJS5q94NPRs6lIAns0yQxFnPE9s9nJl/ePxmoOESWtLgizoT8x2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506112; c=relaxed/simple;
	bh=vLMdxYvBw/lY1pH6xb6PaavX0ZEjZ0354vxgdlA4/sM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXZIJoDXG2IwhobiVUn+eWRTAMJzRjFxwXh3QIgy89PrUTbc96koHMPvJIRaBmovhD58iqEJ8UophcZ9rZtjHGMMUT3YmdwvJ8dlBJKorzxhV+k2m4d8AjYV7NlAgw7k33Xgi+8+wuxhUMsXgQoSPw/4J1vOcvozNFDlFGxGf0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACX7hE8oC9q4tKTEw--.24361S2;
	Mon, 15 Jun 2026 14:48:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Rudolf Marek <r.marek@assembler.cz>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] hwmon: (w83793) remove vrm sysfs file on probe failure
Date: Mon, 15 Jun 2026 14:48:06 +0800
Message-ID: <20260615064806.51139-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACX7hE8oC9q4tKTEw--.24361S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW7AF45trWfuF15trWfuFg_yoWDKrXEk3
	y8Cr97uw1UGF18CFnFvryFvr9rtw1UW3WrJF4fta15Ary3Xwnxu3y0vrnIv3s7u3yDuF9x
	Kw4UX34xuryavjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2YLDUUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:r.marek@assembler.cz,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15102-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5720F683EC5

w83793_probe() creates the vrm sysfs file after creating the VID files
when VID support is present.

The normal remove path deletes vrm, but the probe error path only
removes the sensor, SDA, VID, fan, PWM and temperature files.  A later
probe failure can therefore leave vrm behind after the driver data has
been freed.

Remove vrm in the probe error path next to the VID files, matching the
normal remove path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/hwmon/w83793.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index 24772cfbecb3..8726c5fe8a95 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -1917,6 +1917,7 @@ static int w83793_probe(struct i2c_client *client)
 
 	for (i = 0; i < ARRAY_SIZE(w83793_vid); i++)
 		device_remove_file(dev, &w83793_vid[i].dev_attr);
+	device_remove_file(dev, &dev_attr_vrm);
 
 	for (i = 0; i < ARRAY_SIZE(w83793_left_fan); i++)
 		device_remove_file(dev, &w83793_left_fan[i].dev_attr);
-- 
2.50.1 (Apple Git-155)


