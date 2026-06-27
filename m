Return-Path: <linux-hwmon+bounces-15382-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id njcJCLj8P2oYbAkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15382-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jun 2026 18:39:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 684966D24EE
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jun 2026 18:39:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nGolq32N;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15382-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15382-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A132300D442
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jun 2026 16:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A790314B9D;
	Sat, 27 Jun 2026 16:39:16 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1042F18C008;
	Sat, 27 Jun 2026 16:39:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782578356; cv=none; b=SdjTzavyw1zNU6Ti6QAHfFslxtoLF498zQPOXswR3JNH/E6dPVZJL7Lkz7sUKGAFxawJc4iIL4OzLcQFg1mWQIH5xcmcFig1VTJbymJdY3tDeOehEid40rwwrXxsP2NbAGhkrGaSYXQ7i7bA0lTF/JsQMDc8BHKtug2otG4xUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782578356; c=relaxed/simple;
	bh=QIfCDzoFcP+viA9sNVbr8JyKd1jzefbZ8eYnjRmqDz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pG6lbTU18vP14ZCHFrlAPoFV/zaopholi2gLzd3h0iTTNdfzNL+sf/5c6g8yhTFqlrcjjPKdsEgZNSXkExezmEKfQJqFVYJnT1J/xLfcE96seqA+6CsmlLCIzQ49TDY8wtHnKwxYSwwBUmwG3MBdFgSHqZdrDs1lLBKdm3dcOXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGolq32N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBA41F000E9;
	Sat, 27 Jun 2026 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782578354;
	bh=0BvNz0Ie4ab9gUSU7DwohbxEkLHnqx5EoFweh6YnSuo=;
	h=From:Subject:Date:To:Cc;
	b=nGolq32NZIg+jDQ28qdhVJOFT6FZnrdd68Ti4ERPfT26SUixh68xokGRdaAVeXAUm
	 hvHJvhv5eUMSBd/rUDIrEdeEaxwiGkvkfKtJ3b4xeFUJbuuvXkm9rtxe5mDWD2Itik
	 uwuSYOhl4azbiPwI5MLX3ZcL46VGFzA7Vdo5gH9Nd4OBiq3mv8rj+Nl18Cus+9zXLL
	 fIlvL8YiLoxfYvK0OnQg4f5FiHLUGof67at3B1VvG1IK0DWk49uAfZHMD1fWG91Wzt
	 9CGMKBa2cTK8983swDNFftN4v8OLxxYzh6P8z1PTe7bJK+zJebU3aRdeOCWUKV0ui2
	 07efK7LBpoxOg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/6] ACPI/PCC: Preserve platform-populated PCC signatures
Date: Sat, 27 Jun 2026 17:37:28 +0100
Message-Id: <20260627-acpi_pcc_signature-v1-0-c1b7268d4fdc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEv8P2oC/yXMQQqDMBBA0avIrA2kEZLiVYpIMh11uoghY0QQ7
 960Lt/i/xOEMpNA35yQaWfhNVY82gZw8XEmxe9qMNpYbY1THhOPCXEUnqPfSiblgtNB267D5wQ
 1TJkmPv7T13BbSvgQbr8TXNcXrGtV9nYAAAA=
X-Change-ID: 20260627-acpi_pcc_signature-7b70b0633c8f
To: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Huisong Li <lihuisong@huawei.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15382-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sudeep.holla@kernel.org,m:rafael@kernel.org,m:jassisinghbrar@gmail.com,m:lihuisong@huawei.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:andi.shyti@kernel.org,m:linux-i2c@vger.kernel.org,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,huawei.com,roeck-us.net,vger.kernel.org,samsung.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 684966D24EE

ACPI PCC shared memory layouts reserve the first dword for the PCC
signature. ACPI specification defines the signature as 0x50434300 ORed
with the PCC subspace ID, and ACPI 6.6 clarify that the signature is
populated by the platform and verified by OSPM.

This series centralizes PCC shared memory signature validation in the PCC
mailbox controller and stops PCC users from rewriting the signature before
each command. Clients that previously copied complete local PCC headers
now update only the mutable command/status/flags/length/payload fields.

The final patch also fixes the PCC OperationRegion handler. ACPI defines
a PCC OperationRegion as the shared memory fields that follow the PCC
signature, with the OperationRegion length covering only those fields. The
handler is updated to copy to/from the region after the signature and to
reject regions that do not fit there.

All patches can go independently as there is no strict dependency between
them and posted together for the complete context.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Sudeep Holla (6):
      mailbox: pcc: Validate shared memory signature on request
      hwmon: xgene: Stop writing PCC shared memory signature
      i2c: xgene-slimpro: Stop writing PCC shared memory signature
      devfreq: hisi_uncore: Preserve PCC shared memory signature
      soc: hisilicon: kunpeng_hccs: Preserve PCC signatures
      ACPI: PCC: Preserve shared memory signature in OpRegion handler

 drivers/acpi/acpi_pcc.c                | 20 ++++++++++++++----
 drivers/devfreq/hisi_uncore_freq.c     | 15 +++++++-------
 drivers/hwmon/xgene-hwmon.c            |  4 ----
 drivers/i2c/busses/i2c-xgene-slimpro.c |  3 ---
 drivers/mailbox/pcc.c                  | 38 +++++++++++++++++++++++++++++-----
 drivers/soc/hisilicon/kunpeng_hccs.c   | 24 ++++++++-------------
 6 files changed, 65 insertions(+), 39 deletions(-)
---
base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
change-id: 20260627-acpi_pcc_signature-7b70b0633c8f


-- 
Regards,
Sudeep


