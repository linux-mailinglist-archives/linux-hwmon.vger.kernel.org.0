Return-Path: <linux-hwmon+bounces-12418-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK9RNk58uWmxHAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-12418-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 Mar 2026 17:07:42 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE392AD9FD
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 Mar 2026 17:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8355F3065F10
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 Mar 2026 16:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32C02F745E;
	Tue, 17 Mar 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9oBrIjC"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5CA2F691D
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763629; cv=none; b=s1kQrW9eT0HTbGn3+YQU6VL4soEtJm9BkOpoHs4HskDN1JmrIBhv2/jcpjpYUOCpVQ4ObxHLOqse8P6zIKpKRfLho5vbtA+L5a6DbvKrSp23UUg2kc9pTpQI2vr8enBKI0WiQzTanJocfMh2hlbHoF9FU6cE/WtU1i+/TA9I32M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763629; c=relaxed/simple;
	bh=8W1wLcDuGnh70heYzZXk1lmp712fZJuM8sRYD3B3c+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwSRWecZMxstVf8nq/nyaIEt/BWc/dzkRZD/kYoWyTnZqHFZNarxCVbxWhkx8H9cZZGbC2CnfFaFZNc9tWuWJatwiZBbhEX6FxB6J+xPRX/HavXGN01vhSbPInsZndQMxmVqLd5WzX/2lc5Z8kJ0J+gu25TxARrz37YbeYpHers=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9oBrIjC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aecc6b0861so26388495ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763628; x=1774368428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzkNk18hc0Wjw2irPNMaFA/+tdksSmqqnGsewo6/mYw=;
        b=K9oBrIjCZ1b8lpQpwosLMgRyEO6dXVhuti63bFi9hsnSu9qen07+lAA4xkqcv5JQNu
         KYeRl3ZccP+SEEAxhV0r0eaPpGmpuwkfr+yz3LGbYAe4Zky+ch+9+vlbc1ZlKGSSGtEA
         aEJyVr9LB6QD6Ze0eprOCe9ODthV4HSdDvvDUT9RbVSr8vw0bH6Ui2YtBpbVO5TpP2JI
         YuhKRvkQul6lPW7ZxpqhhDbpValJRm2ssjoJHg/C1u50lEYDMFP5xEm+Mn18eFvN6IML
         JMLcecKS4D4nFCtNy+sDZGMbJN65LIvAIX+qBCCosPuWQJr5cpofukOseUKDvlDDrTSz
         3vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763628; x=1774368428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzkNk18hc0Wjw2irPNMaFA/+tdksSmqqnGsewo6/mYw=;
        b=cjrncYfeOqmSFf4LEzyEkptBHIijjbBTVb5pQSKKoG5q59jPKha94FSAkYgLbnbiTd
         eqFBMKnOdUntjxf6y8NMH4yTPdhVu2EDpuamovExUuz56vrWQ2sYKIeRwSpYmnObVs8p
         l6tvbdXs2VxkwXLQ7esUJJbwEdWf+3eQWoukyEYui9rPpA/qvu/WIh8uQxdgpXkEb6Pn
         ZxtB5VH+rDvR3IuChnrtn9JhLxiWIZFipYUopYriJGyFAm17AdmvwnW5lHo8mdPZRG2J
         wwL1rexpuJ+0+miWWm3ee2bYaxZ60SOS3JmOR1dK26yhdC8q1Ivn1lSL+Mzdjqz6CJM7
         ERbw==
X-Forwarded-Encrypted: i=1; AJvYcCUuJ70pEf374syIVUGU+6ooABymBJADu7kQgZyzieD8PeMTg20DFjQP18vZe2S97UsTSGzJB7ao5VBD/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Pl1RKoNvnbQ4g+3PuYG5QY3AUIFe777w056FrygBi69Kvooq
	ehkFW9GGi8WRVbar6CkC+ChumtpHDL0XWBAV2a4WnmpM7l2W2LOKtLGI
X-Gm-Gg: ATEYQzxcKxBd8c7xwJ1tabdY3lXNa7Tfic5Z+aqGDxHWXVhdZ5OYpMN4vNvbB4mW9zS
	yhM876z3aIkIERcB1PVJ+vqcfPBeD2GBXcBIgNZglsIh6CngMNf/qWS/hRrqTmaBjSqy9TE8PKU
	bVrQE9mtUETtbjvaCdL7us8Of1iywLOXvzlR8XmdIA0AkY4e1aCBAPExbzVpU109yBP+F+chrCd
	QFRtg5AGXYdudRMMn3EaBBWyU0py44qU9pbd+VzONaHeTn1qSlfwUwM3xdHeTbzT2MdPQbIEXuM
	xN3Hd+x8Ynpx9Gkf/IzBFSxbCmFko0qTE9qGzRRq+gAWqFVZuwD3jfxdXQz0QPpQhq3LV6HzqA3
	924h64v1QTH+TwOrBb5TLYhzxyr/JbJfWvfOgTYfathRnIoM8edrvhQqq7c7fKrjbcmMtKZQKWV
	+G2zJVoinVhYw+yqXa3PMJhmuUL3aE4DKyJBc3
X-Received: by 2002:a17:903:2282:b0:2ae:6579:4795 with SMTP id d9443c01a7336-2b06e35b4a0mr344755ad.21.1773763627779;
        Tue, 17 Mar 2026 09:07:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece594b4fsm136171625ad.20.2026.03.17.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:07:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 09:07:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <7c5667fc-6650-4f0a-85a1-1b9c0beb33d0@roeck-us.net>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
 <20260313111955.36811-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313111955.36811-1-aureo.serrano@arctic.de>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-12418-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,roeck-us.net:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: 9BE392AD9FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Fri, Mar 13, 2026 at 07:19:55PM +0800, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
> PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
> Device pushes IN reports at ~1 Hz; PWM is set via interrupt OUT reports.
> 
> Fan speed control is manual-only: the device does not change PWM
> autonomously. After applying an OUT report, the device sends back a
> 2-byte ACK (Report ID 0x02); the driver waits up to 1 s for this ACK
> using a completion.
> 
> The report buffer is kmalloc'd per write for two reasons:
> 
> 1. Stack placement (suggested by reviewers with __aligned()) was tested
>    but hard-rejected by usb_hcd_map_urb_for_dma(), which calls
>    object_is_on_stack() and returns -EAGAIN regardless of alignment
>    attributes. Confirmed on AMD X670E with AMD-Vi (IOMMU) enabled.
> 
> 2. Struct-embedded placement (suggested as an alternative) would create
>    a shared resource between concurrent arctic_fan_write() calls, causing
>    a race if two users write different PWM channels simultaneously.
> 
> kmalloc per write avoids both problems: the buffer is heap-allocated
> (passes DMA checks) and private to each write call (no sharing).
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> ---

Please also see AI review feedback at
https://sashiko.dev/#/patchset/20260313111955.36811-1-aureo.serrano%40arctic.de.

Thanks,
Guenter

