Return-Path: <linux-hwmon+bounces-13842-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hb/BLCw/WmlhgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13842-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 08 May 2026 11:45:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 556684F467A
	for <lists+linux-hwmon@lfdr.de>; Fri, 08 May 2026 11:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D37930125B6
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 May 2026 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C264E3C8728;
	Fri,  8 May 2026 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6iU8h8t"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C73C345D;
	Fri,  8 May 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233496; cv=none; b=sFE7Un/RtTST3cHg8tHeWC4P1zuvO/4PTWkHnjwLWu4NLgauFam4fKhuPns+MwjnP6a6BwmR3+OIM7ttwfyXqD8SqudEGHwS3QKNeRH6J9Uv7vB78wDL1tgCENsjKiR2UaMzDVXUb8U6e0n2bQ4+Wdl6ZCdXK/pobd+TFzuEc2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233496; c=relaxed/simple;
	bh=2gZnkUN+GiPZz6P/qkTlV07W9pEYNv9gia//FyrXV7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MR4SZbUQwg9WFzvt1jtHezFeXzraLR7uWNqEFezzIhaTNHwxIkHJeWBv/I7/kyGxSqsVpdbBn3akON9bag/prUDwGWpUSVNlAGjRdghPk0IA/1R29Co+KSvam940pSwbAnu4GF7gqz8+OM2Qy85kgiv/PfSFsIvP21NrHk5uT4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6iU8h8t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FEF1C2BCB0;
	Fri,  8 May 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233495;
	bh=2gZnkUN+GiPZz6P/qkTlV07W9pEYNv9gia//FyrXV7E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=l6iU8h8tH3+s7OGkIFHAIGiARoMwnlVFA074wiTh4Qba3y1BicokKHTWQAPYLnYZ4
	 s0PODxkzFroc8PH7OqNNXq3pYBMnvFswMAf9BPdaLPo9cB4kYk+gDYKQLMECGMF0u1
	 ke0OUsQVbdGRYqVNPK8kUJRA0UdCNE8aTXummDJ09841FrSnmljVup9P/KplrS8kuj
	 8Q7uCy3ShdQtcfiVjA3gcA4InqQluI5l3rdRGVdfZJuNUQRRZxbZe4m0eluz1GpBzF
	 2+hfklU74+40gJCL3UvgFVzVppn/+chs2h52ruIaQx5helPgtkPtJDVZH8FhZoi82j
	 jwuIFwbvnZH6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFB5CD3447;
	Fri,  8 May 2026 09:44:55 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH v5 0/3] add support for Delta E50SN12051
Date: Fri, 08 May 2026 17:44:27 +0800
Message-Id: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHuw/WkC/33MQQ6CMBCF4auQrq2ZTktbXXkP46K0gzYRMNQQj
 eHuFl1IIHH5ZvL9L5aoj5TYvnixnoaYYtfmUW4K5i+uPROPIW+GgBqk0NyFwKmE1AqEUuRp0bq
 gjTGOZXTrqY6PT/B4yvsS073rn5/+IKbrN6Vwt0wNggP3AgRpb6GqqsO5cfG69V3DptSAMy5hx
 THzYHRNCpVFt+LyP5eZ1zooyl/yxi+5+vESzIqriddYSaOt84bmfBzHNx5svYVpAQAA
X-Change-ID: 20260316-add-e50sn12051-ad828ad6777a
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778233493; l=2189;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=2gZnkUN+GiPZz6P/qkTlV07W9pEYNv9gia//FyrXV7E=;
 b=HBPyY70bvaEbqL9sdaIdTpeoB0FmWDHtQ7F0akVOE/cFlfJhZN4vV0/OsM0QisQqs2iLaz1kM
 60paIIXieTlCfp31xR/vmqW0yJLntQ8YylhEuoXvb1eX2vD4K4scl0P
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com
X-Rspamd-Queue-Id: 556684F467A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13842-lists,linux-hwmon=lfdr.de,u8813345.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[u8813345@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.40:email]
X-Rspamd-Action: no action

Delta E50SN12051 is a 600W non-isolated 1/8th brick DC-DC power module.
With this series applied, voltage, current and temperature sensors can 
be exposed through the standard hwmon interface.

Changes in this series:
- Add Delta E50SN12051 to trivial-devices.yaml
- Add hwmon documentation describing the supported sensors
- Add PMBus driver support for Delta E50SN12051

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v5:
- Add Delta E50SN12051 to trivial-devices.yaml instead of introducing a new binding
- Link to v4: https://lore.kernel.org/r/20260507-add-e50sn12051-v4-0-ff2b3768ac7e@gmail.com

Changes in v4:
- Rewrite binding description to be hardware-centric and OS-agnostic.
- Rename example node from hwmon@40 to a generic power-module@40.
- Link to v3: https://lore.kernel.org/r/20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com

Changes in v3:
- Simplify to pass &e50sn12051_info directly to pmbus_do_probe() 
  to avoid the extra memory allocation
- Link to v2: https://lore.kernel.org/r/20260430-add-e50sn12051-v2-0-d76fe42482ab@gmail.com

Changes in v2:
- Add %YAML 1.2 declaration in binding document.
- Use a generic node name in examples in binding document.
- Add MODULE_IMPORT_NS("PMBUS")
- Remove unused / incorrect headers
- Link to v1: https://lore.kernel.org/r/20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com

---
Colin Huang (3):
      dt-bindings: trivial-devices: Add Delta E50SN12051
      Documentation/hwmon: add Delta E50SN12051 documentation
      hwmon: (pmbus) add support for Delta E50SN12051

 .../devicetree/bindings/trivial-devices.yaml       |  2 +
 Documentation/hwmon/e50sn12051.rst                 | 81 ++++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/e50sn12051.c                   | 52 ++++++++++++++
 6 files changed, 146 insertions(+)
---
base-commit: b584e7d50af502462349910bf4ed30057620b69f
change-id: 20260316-add-e50sn12051-ad828ad6777a

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



