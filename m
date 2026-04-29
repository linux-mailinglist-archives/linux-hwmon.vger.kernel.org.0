Return-Path: <linux-hwmon+bounces-13577-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJg7ECnV8Wm3kgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13577-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 11:53:45 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 598274925C0
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 11:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F477302086B
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 09:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666A63ACF0C;
	Wed, 29 Apr 2026 09:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRqZkbhN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BEF2EA480;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455726; cv=none; b=MTH4lzroHk0fqJ1AwCSdc/9jVKe+swPfHHzLPi1M5Z4drqfWDSf/j0FHHIhBfiRDYlTRPW7NCg9E8gfwbkgqZcYegYkgYbLp1tMSHkjOhKOUbFx8u7WBt/hDTPSCbDsoDZJVRaJs2S8EDP1mkSZK9qM/tvpM51mbvQbfKPAAbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455726; c=relaxed/simple;
	bh=0y9JaSUmIm7Cf56BjsT/WsN/esPBNQXSw1vyf1V8eGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lHIiBdJO9E9vBfJtBqdGC1xrXRHYLXrWHraVjqfEv+hX3k8teEDKJ9Ppgb9R4r+/CfUyYZyYOEMMusJB/4ZqGJiSQV39LnmVwcdh73aBrWP71UP58pJLv41VB9KtBvGgZGut/ivrE9qjHjYoXYHj2r+9ySFV7T2XnD/NmbbVkAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRqZkbhN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFCEAC19425;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777455725;
	bh=0y9JaSUmIm7Cf56BjsT/WsN/esPBNQXSw1vyf1V8eGg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YRqZkbhNQzvZZDn91s6Qg9AORL25l4bqHqrJJtYIvPuaIdgCf8jg7p6xxCFk4uPpa
	 Fl4O9Ydv9UI6QlqPK8LA6jFsS9jLXTx6YSZGGLSKPeguswZkKNlxvv/VxbHL0Gk02r
	 N/vE2tGzCTUQcG5N94Q8bPYDFGOgYGQA71Upt+/XlfDGhSTNh3AlWsit6rXN95HGbr
	 DFnboXz1QgSdP+NRZ2uFYKSLU4gB8z2lchSJ+QAf0lDkPbiFwNy8JKTZ3KIlMJTqek
	 M7TAK8FETnuoAYvM35gTfRwARZj8yx4YIbAFl4Ir4u5Kyghb/QG9IfXYFwPDQ8ZbWK
	 C5fvyu4SV0POQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0392FF8877;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH 0/3] add support for Delta E50SN12051
Date: Wed, 29 Apr 2026 17:41:57 +0800
Message-Id: <20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbS8WkC/x3MTQqAIBBA4avIrBMcwx+6SrSQnGo2FgoRSHdva
 Pkt3uvQqDI1mFSHSjc3PosABwXrkcpOmrMYrLHejOh1ylmTM62gNQ6F0caUfQghgURXpY2ffzg
 v7/sBbxj9k2AAAAA=
X-Change-ID: 20260316-add-e50sn12051-ad828ad6777a
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455724; l=1265;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=0y9JaSUmIm7Cf56BjsT/WsN/esPBNQXSw1vyf1V8eGg=;
 b=mn8qZyutbL7t8frB13vm0Rv2XHlAhqEgI+TlkbfmTaiDwpRdCwt/Rz+QSJNdYGI1+91kS5mFV
 lpfPhLmRI/NDoC9/l8nYi3goq0uXFRm7nQaZHCrHhm2RUZiv9w9TPK0
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com
X-Rspamd-Queue-Id: 598274925C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13577-lists,linux-hwmon=lfdr.de,u8813345.gmail.com];
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
	NEURAL_HAM(-0.00)[-0.962];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[u8813345@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Delta E50SN12051 is a 600W non-isolated 1/8th brick DC-DC power module.
With this series applied, voltage, current and temperature sensors can 
be exposed through the standard hwmon interface.

Changes in this series:
- Introduce device-tree binding documentation for the new device
- Add hwmon documentation describing the supported sensors
- Add PMBus driver support for Delta E50SN12051

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (3):
      dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding
      Documentation/hwmon: add Delta E50SN12051 documentation
      hwmon: (pmbus) add support for Delta E50SN12051

 .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 40 +++++++++++
 Documentation/hwmon/e50sn12051.rst                 | 81 ++++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/e50sn12051.c                   | 60 ++++++++++++++++
 6 files changed, 192 insertions(+)
---
base-commit: b584e7d50af502462349910bf4ed30057620b69f
change-id: 20260316-add-e50sn12051-ad828ad6777a

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



