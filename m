Return-Path: <linux-hwmon+bounces-11824-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB8mH/1YmWm5SwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-11824-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Feb 2026 08:04:29 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A605716C50A
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Feb 2026 08:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 785EC3003813
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Feb 2026 07:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02DF342535;
	Sat, 21 Feb 2026 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY9cLGU3"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A729C351
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771657454; cv=none; b=a//2z2Zf1xoEayo/iVGdEmCTCVzMB7R7tdfOzBHJ5wz5zLutEPgfqu9xHp9s+txxaFMPQpUnI8USnCckcy1Gn1fHSQbNode5wNDHxUlkzmaMk+2iXbT5D/du/dhtQ6EuhznR+EUfLToQe9ASYCtNJu7tsmCSp/3FGKvTw2NcqNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771657454; c=relaxed/simple;
	bh=13CRBHcD6KBHtEqtfL3tA27y+BHqeVSJrLp6MxN/284=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZIn0MXST+f/BNLOyvVviXGP/nQgV2t51eYjDHTkLXyNtYSHVRMOzj1j6ZzjNiwaD5wKRBFOt22LexhjajnSzCFVdBcUva1Po/i4GBR5DKZEa5SasPt4IoIZWiZgpPqElXhQg/soKjBfR6sTxiNct5/ZlYWjosi6eBFIwl5ljHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY9cLGU3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad22a5e245so19228275ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 23:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771657452; x=1772262252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13CRBHcD6KBHtEqtfL3tA27y+BHqeVSJrLp6MxN/284=;
        b=aY9cLGU3nHecSem/fGp49Toc0yYCy34ikk0pEA4knY16l/nZFJdhqPzc3gRz5T/BO4
         wlRqoBVswVxzP3KVxtlmhl+jEJ6NeU91wEPGldotZbD9xrMTsh3new3qKOrJ4GxV0Svj
         QcueFNnRCC+q5jL4GM1NKAeHTzRqMdhq3SNJn/0TCtscryCO3Mwo+9dh4afw7p1FW2sz
         oWhOAccF9R/dpkNl2QZsLVSvnUsYDhfQS6Hj2qJaGrUqXERg7Js6E68EuS4xgCvtCxP7
         VBZmFeVygedAgYO3yOd2qtdtaMnMkgf6LQ4NJ2/fBSMupuhgVMSYwP58y/kiUZUazf9r
         N9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771657452; x=1772262252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=13CRBHcD6KBHtEqtfL3tA27y+BHqeVSJrLp6MxN/284=;
        b=L0leiA2MNE3U3CpfNw6p43uqdRvn9sKbHfNTR8+jdzzClggEI9n5KyadGWLpLg819z
         2IhyvtCER7TftSKBTtYfw9BjJ2+W8xenLjjrvmPQCpJhje/3w8d2rbJ4jZjt7QLNVP1I
         maOp62HVSGrWqlN9nWRPk0ajHP3fVVBZOlTAvhJtsb8weZ9OpVA3W6hmRGIqgkVl3J8F
         XXeEHMn32uZQva1VKhNLn7rIMK8fIBvmsw3/VJ3JLFM2ZI5JKJ34p5XwSGDH3OKJ2vFS
         BREkKO7eIbtpeESBfCbpjnPhe3PysO1mTqmSGoO8Mfd/OhejhhP7+9eIUzE3UtYkyPlG
         C4lA==
X-Forwarded-Encrypted: i=1; AJvYcCUfC7b3cqLJS0Bh20Y+zpOUm3SyYgQk3Grl2RaNnAfaxo43ztw1sUv8sDwoiTyHoCo3jR/Z+0HZpF4igQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxHrqouThO7y7WGjxreDuX1qLkDCb5fWtLa23rQ9Euv2WHzGyh
	6W7020W04RG74XRnKxyF2KFnB6WvtyjFEssNKLczRpKxYmM8cpbR8xIw
X-Gm-Gg: AZuq6aKr+g+rxQdi3QfpaCofh29UTt6xCLbzRQVJJ218O3UR/VZWi22muAG/LWUjxhs
	KC7a8YrDzSjIXBTHL1+FKzmw9W+XNvwnhPFoxxDQgo1HfIPk8viAaspMbkVtJR0cNkfPeMWJxLf
	SshsehChjK/whSQOoLVJsdb5RXN6c68aRTlg4baiyAWC5DRKi07JoCkv1D6EOE/yRxM11JscVQ6
	5l8WgFYQ9Bam7XlfEh0VT2QcBTfNyjErrWqWyddERnJM81rqo+qCB+DgN+3SarAPB4fDjVAYygz
	gpyeKv8Ko+Bjc7RSm3prdRX/lV7i0+tgVl65dZD4+sFaQxDcLhDvFKux1ekeFIlUXYXxRgwTQ5s
	V5ejxKmLvae5JbHlC4U2C+WsNF/38fAXu/xcd08hhPV3lSwNOiGyx3FwAhcSF7AT/rMakk6KNCT
	PsKBwnywU0pbI=
X-Received: by 2002:a17:903:124d:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2ad744edc09mr22461975ad.29.1771657451841;
        Fri, 20 Feb 2026 23:04:11 -0800 (PST)
Received: from donbot ([50.38.105.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dba7sm13929255ad.26.2026.02.20.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 23:04:11 -0800 (PST)
From: Jens Almer <bagawk@gmail.com>
To: ian.ray@gehealthcare.com
Cc: bence98@sch.bme.hu,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org,
	tomaz@mono.si,
	Jens Almer <bagawk@gmail.com>
Subject: Re: [PATCH V2 0/3] hwmon: INA234
Date: Fri, 20 Feb 2026 23:02:07 -0800
Message-ID: <20260221070206.1962499-2-bagawk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260219130127.87901-1-ian.ray@gehealthcare.com>
References: <20260219130127.87901-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sch.bme.hu,kernel.org,lwn.net,vger.kernel.org,roeck-us.net,linuxfoundation.org,mono.si,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-11824-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bagawk@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A605716C50A
X-Rspamd-Action: no action

Tested on a Mono Gateway Development Kit. All sensors reported and the values were in line with a patch created by Tomaz Zaman against the NXP 6.12 fork.

Tested-by: Jens Almer <bagawk@gmail.com>

