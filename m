Return-Path: <linux-hwmon+bounces-14908-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aD2eKbxKKGrMBgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14908-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 19:17:48 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A1E662D77
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 19:17:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jw9ziCqr;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14908-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14908-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E523D31782EA
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2026 16:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B3349690A;
	Tue,  9 Jun 2026 16:45:19 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ADF49691E
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 16:45:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023519; cv=none; b=rvg227K4s20SAOUf/DcX7B4lGzsL0eyc5E1Jxoz7g6O2l7yI4Y6bYYAgcF0FWtl9iXzyhUGcxayhcJtPjIpjiseN8B/zqd2MTTqlxnNo9iGdyiV2sP/BpDqLYqIO7Tk56I4EKyCGg7UjDYc2eU+f7IG8Jh36584qQMshACkwQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023519; c=relaxed/simple;
	bh=8wausxUPOgNLfbiJPcncQ/auFbeylOlT/hS6b0Jagkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EYdfAii/jiN63X+AMGbG4XM3Xul7sSL+gv0r9iQDUNdCesM4w+STZM6yBIkyM0P8dsIobsV2Vpktgq9c78h+0QC1qbMLh3QWcdV6HvbNeRYh5m1wSOopdwlP42EN1D3REuv+cQw4RiHqVGxbudFPd5nJRdOULc6J+DcAlV6vACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw9ziCqr; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cdae130cso16408175e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023517; x=1781628317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0k7ym6VlytNaWxTXaJuUlFnXBgEzjB0STL4A4y7nWg=;
        b=jw9ziCqrcapOwsjAWmjsJscmOG/q+W2llTA4TY5+/25skz9FKZopocwKC4kZiOTyCE
         5QKpDlXBppK8zazlR5aEj1FuD6mnLIrNRWb05w5UrL/AJiQgj5Pk55LQelS3az4xGyOj
         W0TOx8/xUol6ViX973NJJNXQG1ARDvJKFz0TS4tVbgS2vS/EADwrn0v+XW7u2+o+pC3G
         BwixQfndX2YDkIusCMOJLjVtg2n5mVBDnot7PfN1V5PEID7Ol926HLrbYh5jkggVIoIj
         wALfXhRJ6FFuxhrirddUEN7+dfNCzxRYxdNXvst/pdyKq+9wsoGEpL+HhGSFEivM1SJ9
         Al1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023517; x=1781628317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0k7ym6VlytNaWxTXaJuUlFnXBgEzjB0STL4A4y7nWg=;
        b=Rli03SYnWGaF904mw9FYnVMW4kyA8Jc3aiAXlvDKy3JjWM4gAN0Kj+cHpCfzS1uy3O
         mKUyr+HtBTRKvWmad8aKE9OaTOKykUxDgLeL/j1b4v8zCbzOauebJ3OH8NMVVT08qHPG
         6JsJgXd1eJxTi4nBYPr8XB5VsPQkBqO7AZaBVJCnOXH7A/cdueDuMavzV2cC7BhX18j2
         WKamlYtC5CWnhLTXwvZNlnEEmKEGxZC+h2jVnLO5FwoEL7mhreIITjpOB5U1xYDL9xE6
         mcj5sskyamHu1TMDFfF0mk5g6kBks5AABRqKHYpVFU7Fb/54es8+uv7Yc6VqeEyE+m8D
         x1Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+3LlscdR4dBKv1N8HTWu5kzU3r1cWIoRPcUQ0SwpYK9laFUDKSHlFu9h4gnQKZ9UOC2Gw+/NNOOmV7YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLvmBBTNvvhpvQS/L5K7dMVB5mEGo3fNlQilwoIn6eRy19vEJf
	5ctBXeD3BLqlXS0/Yy2h2JN9+2EmWtqiU3jZvbFvUp0tWWAHtD6CchdZ
X-Gm-Gg: Acq92OHQqH7RhGkXK76Ahhty6DQjDQVe02DcQXWzEn0Al6L1dUIoQNwXJHvAARkyigf
	AOQ8gX2nPJuMHsWkghu3XbWjWRPRc8SSYgQS6oEuy5bsFXA/gJmjFTEj4tEOwwn0GWVUppvVa7a
	ZVB9oYGFis8L7jvUXIVTuYZUGe1dz1I8qP0ALLlNKPN4YZM/cFO8lgNWc9eXtU78LHtQeJ2/FVi
	/NofgL8GAoMr5Qx9KkpSf6ZP/iF3b6nMbFhfqTmM8zVVIoN424iTctp6YCK1dciTgbHQeSNix0W
	PL8b7zaaNW4RzDWfmy0UYXw0mPOOUA2bRjcUjdD5haZACu0vd8sRkVHnHl5ur/7HxfTjMjFNzBD
	pAnQZ+rjvgZyhOhnCn6lUA7H+oRZ+vdxoE8gjrt3D1S+vALjMdPACHb6LeoTKYVg2OHX5cRTas3
	XXUCQQHx0IKrQR/CzS
X-Received: by 2002:a05:600c:5488:b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-490c25b1277mr404826055e9.12.1781023516628;
        Tue, 09 Jun 2026 09:45:16 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm59351635f8f.8.2026.06.09.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:45:16 -0700 (PDT)
From: Louis Sautier <sautier.louis@gmail.com>
To: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 RESEND 0/2] scsi: mpt3sas: add hwmon support
Date: Tue,  9 Jun 2026 18:44:21 +0200
Message-ID: <20260609164423.2829699-1-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14908-lists,linux-hwmon=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sautierlouis@gmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sathya.prakash@broadcom.com,m:sreekanth.reddy@broadcom.com,m:suganath-prabu.subramani@broadcom.com,m:ranjan.kumar@broadcom.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:linux@roeck-us.net,m:MPT-FusionLinux.pdl@broadcom.com,m:linux-scsi@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sautierlouis@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36A1E662D77

Expose the IOC and board temperature sensors of LSI / Broadcom / Avago
SAS HBAs that bind to mpt3sas through the hwmon interface. The data
lives in MPI IO Unit Page 7.

The same fields are exposed by Broadcom's userspace tooling through
the /dev/mpt[23]ctl ioctl path (typically root-only): IOCTemperature
and BoardTemperature in lsiutil; ROC and Controller in storcli.
With this driver, sensors(1) shows them unprivileged:

  $ sensors mpt3sas-pci-0200
  mpt3sas-pci-0200
  Adapter: PCI adapter
  IOC:          +42.0°C

v2 -> v3:
  v2: https://lore.kernel.org/r/20260518184109.770185-1-sautier.louis@gmail.com
  * Removed stale Documentation/hwmon/mpt3sas.rst reference from
    Kconfig help text.

v1 -> v2:
  v1: https://lore.kernel.org/r/20260512214703.655633-1-sautier.louis@gmail.com
  * Dropped misleading Documentation/hwmon/mpt3sas.rst.
  * Dropped inaccurate concurrency-wait figure from Testing;
    corrected empirical data is in the on-list discussion.

Testing
-------

Validated across three Broadcom SAS chip generations. None of the
cards had a board sensor present, so the testing only covers the
IOC channel:

  * LSI 9500-8i / SAS3816, SAS-3:
    - hwmon device registers as "mpt3sas" with only temp1 (IOC) exposed
    - IOC reading matches `storcli /c0 show temperature` and
      `lsiutil -p1 -a 25,2,0,0`
    - rmmod / modprobe cycle goes through the explicit
      unregister/register paths cleanly

  * LSI 9305-24i / SAS3224, SAS-3: same behaviour.

  * LSI 9211-4i / SAS2004, SAS-2: firmware reports both
    *TemperatureUnits = NOT_PRESENT, no hwmon device registered
    (graceful-skip path).

Not verified (no available hardware):
  * Path with both IOC and board sensors present.
  * Fahrenheit-units conversion.
  * Sub-zero readings (signed-cast path).

Louis Sautier (2):
  scsi: mpt3sas: add IO Unit Page 7 config accessor
  scsi: mpt3sas: add hwmon support

 drivers/scsi/mpt3sas/Kconfig          |   9 ++
 drivers/scsi/mpt3sas/Makefile         |   2 +
 drivers/scsi/mpt3sas/mpt3sas_base.h   |  19 +++
 drivers/scsi/mpt3sas/mpt3sas_config.c |  36 +++++
 drivers/scsi/mpt3sas/mpt3sas_hwmon.c  | 200 ++++++++++++++++++++++++++
 drivers/scsi/mpt3sas/mpt3sas_scsih.c  |   6 +
 6 files changed, 272 insertions(+)
 create mode 100644 drivers/scsi/mpt3sas/mpt3sas_hwmon.c


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0


