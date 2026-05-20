Return-Path: <linux-hwmon+bounces-14362-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKRFM8QmDmr26QUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14362-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 20 May 2026 23:25:24 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1359AD1A
	for <lists+linux-hwmon@lfdr.de>; Wed, 20 May 2026 23:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25CEF31B5251
	for <lists+linux-hwmon@lfdr.de>; Wed, 20 May 2026 18:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15243FAE1D;
	Wed, 20 May 2026 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKF22ldw"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFB3F871A
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301007; cv=none; b=FFS6iJlhsm90w20qdJfmvQZrI/na76xbg/3nZmv6LVU8KPOnWi23tAwD10HK1erJQwlFENUk6uYt8rPyRp4ousRAPgCNYv3FTbq0dcHyX8Tn52VdAEB31kQPYurwcAjzHKZD7bRk8q8emBmQt86imfvccZzaXu84w2jrcpWl84Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301007; c=relaxed/simple;
	bh=l6DKCXjemggPrcXPN7QV86I1EbhcMscTp0hAIaRQquc=;
	h=Message-ID:Date:From:To:Subject; b=MHYt+SMiWcEXpysLldDAJAuLNEwx9kUhXDqFNU38LIPdDvwcIsiVWC4qf4cHkbsgwy7dAeVPo5I5GBcivMvJfIN9VsREbwoNb9Zwp3/wutacnzm5cgRwtxHVL3OBsewevC2iM+TU87RBVz5PTrlZ+vVkZ+vJ8s+df+Ga3gnjrRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKF22ldw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba6485d219so38210135ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301004; x=1779905804; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6DKCXjemggPrcXPN7QV86I1EbhcMscTp0hAIaRQquc=;
        b=tKF22ldwRBHrnpuYpL4rGlTMLCLz4CkWsQgR5drOXAMNl0J8/uXWk/2VS7ozwNhIoB
         k21ZcqWuO8TpBZtxNrSXRbPbPTGTARf1QwP7JDIwflnwok6ZGKCpKfJ5D/Jy4g/JQLI5
         O74fdx80ZrIDkZHlV3cyxdWS/0NcX/bKZ9+BrOUxgbV7PtzVoAr/56G9cbZxvPblms0L
         Y6jrhohzb7fDPwGe3NRv3ydW9TWr53BAYTi+2KEOYWDF2kM1kAt/ovXXfEGcDdH6MaNl
         RmHFqMhen6IBX/DOg5Htla1hGjA+Jq1qUCVQDktudNjw7HL098lH97R6ybbnuTpBsu7M
         oWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301004; x=1779905804;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l6DKCXjemggPrcXPN7QV86I1EbhcMscTp0hAIaRQquc=;
        b=PjJpAa1lPHmeKZrXy+mZJNA8U9SiSRYJfcF/nyTuGMPBCTOlv2NxzSE2kJh8P/t2T9
         J9q95xAE2uHhehR/fplKW6P6gks8niqe54kB8gsTWRxnbAuApv0iYTh3vNE5CCu6kS6k
         po7REH/tZ2kthovsSUlgZp4vamzYa8LA9xlLxLrm3dxOrdSqDWyLlZ5FuRMfjhUSUFYP
         QrcK47N9go8nEsxHJtKq3O/UluhykUaMTQ44RvJVNvjcgaHebVbCzPAw/YTsjkoTUKlx
         xubWGIqdCDpff0JvYmA+p2Rh7WXrbUvlutfA3AgdEe0E8wHwIid/2ZOfpYBeCfJmrj/e
         V64A==
X-Gm-Message-State: AOJu0YxukJYSO54z4kIdHy6aHozfqrpuvMclVlE0eUMaArg8fp640vbk
	v2o+4N+KjVB5qIeqUWKsCnBFSDrsF55MfVnxF9rvXzVpp+WGWsJz0ZkGze9PJmJpeD8=
X-Gm-Gg: Acq92OGEr0AKHw+glmfNHc3UTjIi6M6YU4XXCdqoxBcvpCCpPqfG6FM7FGkepfaU3iO
	DUmstHH82BYDeGYYULKBsfIrcQbds8/2VOs/IO8aMi/HqxuiMTXKhhPgOF13DGEotrbI0p6v5Me
	xXx9lcVa2pfBJcWuR7zwqtu58O4Lj8sv4Ezahjb5tESTiVZIMMCteX5IjcIdTy8MuwxNbcWHcwz
	cskUe2i1kT59GD47QyTG0xr13lRxDzUDOz2OBzfJ2n/kR50L9XPMqn7riA4LOEqFUOZ53HSvOff
	c5ZURDmiCrsUGn+qUMSv9glMVYwPGUqoA3YfAiVjQiGd1VDWVp0+QDc3qGQh5yCbhy8sbYjGqz2
	nA7KHXlGsDJQuUpxdQaNnmJnKpSdM469kbsjaw3OLzpysdwOaHYRAOrqKovZ7QfcQZSJu+mxzYd
	VLMkshm76DLGCJ2thfzrU8LnnLilOAdrq2yu1iRBaIXV68VyGB0USklSH2ajMzCtIZAIuyh7p2s
	Bprs0Jh4VfmsJoCuQ7JfQ1qpFf5neCjhsOAaFPczo0=
X-Received: by 2002:a17:903:4b0d:b0:2bd:7684:34b0 with SMTP id d9443c01a7336-2bd7e8a4e47mr260942145ad.15.1779301003830;
        Wed, 20 May 2026 11:16:43 -0700 (PDT)
Received: from localhost (ec2-35-94-83-63.us-west-2.compute.amazonaws.com. [35.94.83.63])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2bd5d0f8efesm233502985ad.55.2026.05.20.11.16.42
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 11:16:43 -0700 (PDT)
Message-ID: <6a0dfa8b.f4d142a5.6d373.e680@mx.google.com>
Date: Wed, 20 May 2026 11:16:43 -0700 (PDT)
From: jongsuktinalee@gmail.com
X-Google-Original-From: PayPal
To: linux-hwmon@vger.kernel.org
Subject: Invoice Generated | $537.07 | Ref: TXN-B5YE-LMM7-J83Y
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14362-lists,linux-hwmon=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jongsuktinalee@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mx.google.com:mid]
X-Rspamd-Queue-Id: 47B1359AD1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Subject: Your PayPal Renewal

Hi Customer,

Thanks for being part of PayPal! Your 1-year membership renewed automatically at our special anniversary rate.

Renewal Details:

Service: Virus Protection Security Pro

Customer: Customer (ID: UID551649)

Amount: 537.07 USD

Need help? C_ontact u_s: +1 (845)-212-9062

Best,
PayPal
+1 (845)-212-9062

