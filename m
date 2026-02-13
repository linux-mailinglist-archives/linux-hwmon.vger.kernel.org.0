Return-Path: <linux-hwmon+bounces-11712-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKSlHuzKjmm/EwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-11712-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 13 Feb 2026 07:55:40 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A4133512
	for <lists+linux-hwmon@lfdr.de>; Fri, 13 Feb 2026 07:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D96F83052634
	for <lists+linux-hwmon@lfdr.de>; Fri, 13 Feb 2026 06:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DCE276050;
	Fri, 13 Feb 2026 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="WS+JEqd6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53077261B8A
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770965737; cv=none; b=pfG+aObEv+wS31FsJoENHJoQ6F6LBfk7n7N4w/qMnO/K0pMfYxBq6aljyV3D5vkKq/X/DRdMjvJ4yooOlxfouqrjSQR9+KL5flSBxm7ZM5H84OnB+sfwRIt761x7zAvmJr3/ddL0qHeTsH9Ona4jo9r88DCfwkmhFBo/FnuW6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770965737; c=relaxed/simple;
	bh=AVZCl4GZmpqjSi6R8hLihqG9KSmolznsgfA2qabbatk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M8gKLBZXfrWrlbCnp3XvdZMluVbbXrpicazPLTzUs2A1c0WboBgtJuILpohungsBoCRygQKbL3sPvknfyaY1Itg/DpbfnzTv1lCtfgmskC5IY03QWY0ON2f6kz5nFobKyTjPLkDXf2UaN30amViFTCWGEq17sd+Cqi8LIqgGwAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=WS+JEqd6; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-463a0e14b4dso55195b6e.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 22:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1770965735; x=1771570535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVZCl4GZmpqjSi6R8hLihqG9KSmolznsgfA2qabbatk=;
        b=WS+JEqd6Nla0TFp+blKDWajzhd0pnsnr+N42E+Cgf8RGMStl9KgSQhf8Z7I+y9R58l
         aTvMB6jcuyIjHMdAqcmTIzsGcAeaVOWrMiat72Sz8yeorhY3Ortzp/shQwmEj+Bt/2mS
         1SmyPQdxSLomcLwD3U5KqbTG9VPWLzUC52mT+/90mmoVqfINvTE2Uya9wD6pvuyNMVM9
         C6dTx2jvm8WVIO7xzhirOQFj84j+6X8shukGgOaAV7tps6FhppUiZkrdQbAjn4YEkKdC
         gZ0ENuoG5KocRSQ1Fi9yxX4MU6c52G8bi9gBmIO3uVwkYMo7qx0X+6n+7sV1SEAstkEn
         YF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770965735; x=1771570535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVZCl4GZmpqjSi6R8hLihqG9KSmolznsgfA2qabbatk=;
        b=jLoPx0H+w5XKWu386G1qHAoeMAsw/zFcfQ+mWPzpog4VHXDNSGsum54oe0WWzFde1D
         ZxCNzGglWzQ7ErelLlc4ZqQROm9DmY9wqHQFgGSjgXLjW421rJq5w36ZlajlPFwcFIJV
         aX6dYwStdeUJFlLbT/j4ft8lSLDpR9HJkmdbH3pfMD2326jCMxjbJ7vUZXPoyFrOPU7Q
         UzaAlIqIrH9pjpWY88v+uHKDBxIOVFYDobIqnRjrk/eBsxT3dO7RwZaQfmk6MBlDyq1b
         NLmsFqnifR5DXHeWDIS9+r6VUsNzRDLAqGGHt0rkwe5zP0MqiF5KUdIQIGznIS2nhNa+
         DfLA==
X-Forwarded-Encrypted: i=1; AJvYcCW8I89mRYH137eTXYNuy0opddH7U87TbsKKypnlk3kppAsfRDRwlazKSA8+JmqD63ZxsLm2T2qau6g3qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwC+krCETyqSksXM3Rf9RARNZsIkbRdBEY5+lCjal0Aoxp0hz6
	G66J/UyVhM7XPb0SK3rO2gc1vu0Br+DSFEaLYqFuBLEaVgGIQEEUERFfzWMW3xI2uN3a3StVdqU
	n/Q7X+B0=
X-Gm-Gg: AZuq6aK6t0m6r+GT7/yFjTv5LZQckhJcWRmhdIoidciGqz0ehb04BYCz2vDZXFmqYdw
	cxz725+0zPW7iYrXK2NSpF1mpQssQxKVQaWMbyrZmxz5/P+paAre0EgmYNNQlcSY1nClD/A6HXX
	p+98eKRdzTKWLUR3TMQW4H1sMxyyZUdx7/lXgwgARehC1qlUxPG5Eq7JJ7iDX7HB5GbPNVj+5Xx
	5O8jvJLJSAofFA3LNOaX7VFNNXOVokKkSjyTgH9J3uOOYUmOXxPJBsmdD2D51hSAjb2Jf0IXgXm
	teFavkw6qxAdtPlxmm4RBztbS6aCu8Jg50pqo/fZPvevCYaQmZ47fjAPxhKMP3BdnEvosddg6XR
	PfmVUT7Gr8zaFQK7VhzGyyzm8kxuypiXbYf1pPcmqNSzi2LG5J6+0VHiuqJeLlkH7aocF3D0CtR
	KLIYVDUcN2/D1Zx/K3B/n04nwk8uDwDb/9TB2OXTzHsOxnGWDJ1swswuHWwzZDdkHa2EAkSJC8l
	bapBg==
X-Received: by 2002:a05:6808:1b1e:b0:451:4be5:a90a with SMTP id 5614622812f47-4639f249f7amr423087b6e.51.1770965735267;
        Thu, 12 Feb 2026 22:55:35 -0800 (PST)
Received: from localhost ([2001:470:b8f6:1b:a3ab:7352:1dc1:6b46])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-40eaee485b8sm6178906fac.4.2026.02.12.22.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:55:34 -0800 (PST)
From: Corey Minyard <corey@minyard.net>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Igor Raits <igor@gooddata.com>,
	linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: [PATCH 0/3] More fixes for BMC failure handling
Date: Fri, 13 Feb 2026 00:52:12 -0600
Message-ID: <20260213065351.915707-1-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[minyard.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[minyard.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11712-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[corey@minyard.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[minyard.net:+];
	SINGLE_SHORT_PART(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A9A4133512
X-Rspamd-Action: no action

These are in addition to the previous patches for this.


