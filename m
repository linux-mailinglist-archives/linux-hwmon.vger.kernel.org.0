Return-Path: <linux-hwmon+bounces-15879-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9wy3ELjxVWpwwgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15879-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 10:22:16 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F8752560
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 10:22:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=vPmZLd3R;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15879-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15879-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D8DB30113BD
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E153FAE1A;
	Tue, 14 Jul 2026 08:21:16 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E953FAE15;
	Tue, 14 Jul 2026 08:21:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017273; cv=none; b=gmAhZwygQJXOzeLL+1m3FMyvE3HF4Kz2snYaJgApW+ui07RGqVS0kCFzr1XMKEPankcoHk36WrkJPS637IwBMh90YRyYkDtFCpjuPKTXA9l8G2dmfFopAsHX6vRrz9DF3YI/a82/+vXEF+eU7W7HY/zffSBRUw3lXhsA/xgLt90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017273; c=relaxed/simple;
	bh=12v4kLfM0t53W8e1jIm92V7bHObkh5Z/3ph0XkzStPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EimKZIQiHGQtAo2/UChdx1BLylomDYOdZgzdV4+L2m8xMC3tpBpgmn1osmsTlvBqRVdmEfn17KLIyyCRdF7rt2VMu3TQInzlDSdEuNfezIrUGGJt2y+ff9M5FOBLXBpKyQRqLUvdW/qD+LWMO3s5bBZkmL1HVp0QuvAKeHcJrjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPmZLd3R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E7D7C2BCFA;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784017271;
	bh=12v4kLfM0t53W8e1jIm92V7bHObkh5Z/3ph0XkzStPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vPmZLd3ReB03x/cOY7Z66BXyUlWt9NN7Bq+3UqiaZbJGKFe2DOSiaHhGGcX4/i03P
	 qkwZE+2aVKlmsL+wCFJnvUY83g8IxTudBtHbZzmrNqRrCWyh3UwEUpQ2tT4uxczjev
	 F9fHIUMX9ZOqAF7PRot3kUjCnDHCBYlHpIPCBWbiHHyGD789D8H/w0dLz37ZZbH/EV
	 EscT6/wu0JPBp+wq3FaAVd8gmkwcilQ8CQklxtfmS+vDZ/o7qwNqaKlX/2ZXNBiFkP
	 tGb93Zjydec50JOUAAPI4cwRCiLkHSratOV2hBTpn1Wtvir2S0LTPCzfrDRXjew6ED
	 9t2DIeDjEmqKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46673C44508;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Tue, 14 Jul 2026 16:19:35 +0800
Subject: [PATCH 4/4] hwmon: (kb9002) Add documentation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-kb9002-upstream-v1-4-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
In-Reply-To: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784017234; l=3142;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=N49+QrvixV76oNVim+qejmy5UhGOUcqywymzDOcJACo=;
 b=J8pTjlGcewVJ2uWOgm1rGzZ5vNCgSsjQ4/Zo3/xaIYmypB6O33r4rcw7m3RnPnkQxhSeAR1go
 T1Ciw6+GTJHDZJ0v4rR4st3Bk0UgxZLHrW2ei9UCy1sXs3OSbBbiOzD
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15879-lists,linux-hwmon=lfdr.de,Andy.Chung.amd.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andy.chung@amd.com,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:Andy.Chung@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[Andy.Chung@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,amd.com:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B6F8752560

From: Andy Chung <Andy.Chung@amd.com>

Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
driver.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/kb9002.rst | 65 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 226789376217..9dc796d087dc 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -112,6 +112,7 @@ Hardware Monitoring Kernel Drivers
    jc42
    k10temp
    k8temp
+   kb9002
    kbatt
    kfan
    lan966x
diff --git a/Documentation/hwmon/kb9002.rst b/Documentation/hwmon/kb9002.rst
new file mode 100644
index 000000000000..e6d8d9c78923
--- /dev/null
+++ b/Documentation/hwmon/kb9002.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver kb9002
+====================
+
+Supported chips:
+
+  * Kandou KB9002
+
+    Prefix: 'kb9002'
+
+    Addresses scanned: -
+
+    Datasheet: KA-015171-PD (available from Kandou under NDA)
+
+Author: Andy Chung <andy.chung@amd.com>
+
+Description
+-----------
+
+The Kandou KB9002 is an 8-lane PCIe 5.0 retimer with an integrated
+microcontroller. It exposes an SMBus 3.0 target (with mandatory PEC)
+on its sideband interface. The internal firmware aggregates per-lane
+die temperatures and publishes the maximum value through a 16-bit
+addressed register window.
+
+This driver reports that aggregated maximum as the only hwmon
+temperature channel. The running firmware version and the firmware
+boot status are exposed under debugfs.
+
+sysfs interface
+---------------
+
+==================  ===============================================
+temp1_input         Aggregated maximum die temperature across all
+                    active lanes (millidegrees Celsius).
+temp1_label         Always "kb9002".
+==================  ===============================================
+
+debugfs interface
+-----------------
+
+Files live in the per-client debugfs directory created by the I2C
+core: ``/sys/kernel/debug/i2c/i2c-<bus>/<bus>-<addr>/``.
+
+==================  ===============================================
+fw_ver              Running firmware version in
+                    "major.minor.patch.suffix" format. Read-only.
+fw_load_status      Firmware boot status: "normal" once firmware has
+                    finished initialising, "abnormal" otherwise.
+                    Read-only.
+==================  ===============================================
+
+Notes
+-----
+
+The driver requires ``I2C_FUNC_SMBUS_BLOCK_DATA``,
+``I2C_FUNC_SMBUS_PEC`` and ``I2C_FUNC_I2C`` from the host adapter. The
+last is needed only during probe for the host-interface mode switch;
+runtime accesses use SMBus block transactions exclusively.
+
+The retimer's SMBus address is configurable on three strap pins and
+ranges from 0x20 to 0x27. The address is selected through device tree
+(or i2c board info) the same way as any other I2C device; the driver
+does not auto-detect.

-- 
2.34.1



