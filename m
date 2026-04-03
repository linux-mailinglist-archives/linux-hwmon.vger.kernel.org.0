Return-Path: <linux-hwmon+bounces-13060-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O4IFT6Vz2nmxQYAu9opvQ
	(envelope-from <linux-hwmon+bounces-13060-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 03 Apr 2026 12:23:58 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6207393463
	for <lists+linux-hwmon@lfdr.de>; Fri, 03 Apr 2026 12:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A185E3045011
	for <lists+linux-hwmon@lfdr.de>; Fri,  3 Apr 2026 10:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0E338D012;
	Fri,  3 Apr 2026 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/iEy5hp"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CBC38E13C
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211321; cv=none; b=YcfafUc9Vu9a8kb4iJEaphSazusoyYBs0B2P41j/gd0sbY+4CsXFBFLwCAoqa3vpZE1FZF2LFGB2hjOC92W39G5XBFB3MnbjTJlIqBRVzIyr1ON6uHwN2ESxph3MF/rOsvHDUQQdN3PLfx1Xnv0hfIeS4fKmsLTFdjiwpZWzR7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211321; c=relaxed/simple;
	bh=h3I24CTb5jX9WGJt6epP09hxWvmgnw8nTrRLajn3JUw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=V6qEZjSW6L8mMYU+wT2T9LdLeGBV5RqmUUDd8Tb7Ag1gCtjo1aHmSnLuuirAFAE43O/a1BPUgHsgm0ugDryopToEc6fc6VIl78kdvJhgdRQInCaribTc6wteDGR3FWSqPgR52GcTVQNfuoPzbgzIizrqs8iJnqGE5NdMtaeYvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/iEy5hp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d95017a68so953373a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211318; x=1775816118; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYmwpBEwEzhMBq9vPab5w9jLzKpAAUkdEEETPjab/vE=;
        b=f/iEy5hpfrOLl7ODqzoPe19kut6EAsbJNQd/vWi7kqH/AwQz4Yq9GnuUs/6qq/i6lT
         4Z5ap3dv4F/l2XjnrxoS6dGgBSuF9ADdQZqE66RAnFm8J+D4iSNnrugJy9AK85Fv4SHg
         IUZKS1GlI+NPNy0dway4pGIxWs5Bl4HftsY1WmSW2ys6ZJZUL6B+nOAc08tCx3yxIOAI
         PxBopOGHVmox7+cuWQLHnaqUa45ngH4HuIm/thYFNpRTpJTEi0B1nAjfK6CIeXsGyKHx
         tB9PkoLdEk+qrwuaLY9vPrOdchCo/pPDzgJDYH+uKYVAMmIghYlyIiSQA7p6+rVR2kXA
         CSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211318; x=1775816118;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYmwpBEwEzhMBq9vPab5w9jLzKpAAUkdEEETPjab/vE=;
        b=glN1ZbLkEH7Ne9wO+ob2IqsU8kAde8f/K55jK4FbACaN3/1SG18XVrNA46MBTtlAiX
         fmgK9Ho8rK6nIUKWWZkFwQKSbiSnR/OivRm9eIjBlck7BL74tv13Wh6rI25xPtyAMYz2
         EfD7iEEKHdLCRtlp5j+s99kz6dbpjva8Pt3fxKalX4KX3cuOTEyJTHKRjVWFjF/3DXyY
         0XnQl6I0jVXgToWE1Lj7/25RSEOzVRMDGHJJlx7Qidw6nFbv/DYRBDqAvPcOJeTEzqjF
         e+gEoR3c6gTaobhBpJPCf857hSgWimrhVUdBjK/sChXWJC9GXTDW+x5ryZAev1LlKqTa
         BkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUos5OB3j7vL/qmyKPHGiK9zJaarBzbsTzJK/PtXU2x8f0aRBxIwKUNL02V9/hVNKG5qsJwhEqOTLn5dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7MbB1y+wK8st7KKLHxFuYErniki8uMkUz3FJOrb690vdG3Re
	hLuVW23KTY5BFTRjHZ3gd3S155JYEqehz2NG6v0BADNeNr+wjF7El3x9OPpEBfVq
X-Gm-Gg: AeBDieuWj+XsFA9MteAzATCD28k3eSH59VSNbAfMLVd9yqdwSUP2RhwNdoSaNbGF0jd
	94MTyHe2QXRdzpfOyxhWhDx0Pdv6Ez1lijj3+T5KKPpZ0a5cbvJT3NIndHrP48WyBe5rNXqk8Tt
	xfc0TOG4tXa8Pkb/bkcTO0LJ8q7V/tHRiK0Qo35Oacm7H2H2wNZmaKCuht48qOwc5gjkd5Ullcb
	IyRZaanXp7EuPTmYvzEzB6HHKfsuhBsUDlRLLjzBWaRv7iC0XOqVZcqPKhRZSg7OyUviLRtMrPA
	5Kwwjb0BJlgXxAA8B+Yuxotr87lS1852c/7oHrXleHXzohWQ5XastvKBJNFK42W5yoP6Y4hNlXL
	+5UPm7/nqMkobRJ+mQ2B7ZctZrLnuKzTvhqK5DrW5QkDONDREfbKsJmW7aY/OTNPlxn7DV2Lnf6
	pF/aK0OC9sR1Q+C+ElaysthLU20xQZ6e7WWKxFsM6/aRg9MTTefIAH
X-Received: by 2002:a17:902:f642:b0:2b2:49a7:a5c4 with SMTP id d9443c01a7336-2b2818b00ccmr23090525ad.27.1775211317393;
        Fri, 03 Apr 2026 03:15:17 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:16 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 0/3] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Fri,  3 Apr 2026 18:14:53 +0800
Message-Id: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13060-lists,linux-hwmon=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E6207393463
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

First, I sincerely apologize for the noise in v3 and v4. I unfortunately 
missed the crucial feedback provided in v1 by Krzysztof, Conor, 
and Guenter. 

In this v5, I have completely dropped the incorrect approaches from the 
previous versions and completely refactored the patchset to strictly 
follow the maintainers' guidelines:

1. Wildcards are entirely avoided. Explicit chip names are used.
2. The standalone YAML binding has been dropped. The devices are 
   now added to trivial-devices.yaml.
3. The redundant of_match_table addition in the driver is dropped.
   The driver now relies on the I2C core's fallback matching mechanism.

Patch 1 adds the vendor prefix for GXCAS (Carries Conor's Acked-by 
from v1).
Patch 2 adds the explicit SHT3x/STS3x and GXHT30 models to 
trivial-devices.yaml.
Patch 3 adds minimal I2C ID support to the sht3x driver.

---
Changelog:

v5:
  - Dropped the standalone YAML binding file.
  - Added explicit chip models (sht30, sht31, sht35, sht85, sts30, 
    sts31, gxht30) to trivial-devices.yaml to avoid wildcards.
  - Dropped the of_match_table addition in sht3x.c.
  - Wrapped all commit messages to 72 characters.
  - Added company website to the vendor prefix commit message.

v3 & v4:
  - (Incorrectly) Proceeded with the standalone YAML file.
  - (Incorrectly) Added of_match_table with wildcards to the driver.

v2:
  - Fix placeholder "Your Name" in MODULE_AUTHOR.

v1:
  - Initial submission.

Zaixiang Xu (3):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: trivial-devices: add Sensirion SHT3x/STS3x and GXCAS
    GXHT30
  hwmon: (sht3x) Add support for GXCAS GXHT30 sensor

 Documentation/devicetree/bindings/trivial-devices.yaml | 9 +++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 drivers/hwmon/sht3x.c                                  | 2 ++
 3 files changed, 13 insertions(+)

-- 
2.34.1


