Return-Path: <linux-hwmon+bounces-15487-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1SJ5EBTYQ2oSkAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15487-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 16:52:04 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1246E594A
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 16:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eguBgHH2;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15487-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15487-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E355B306056D
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 14:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8887043C07E;
	Tue, 30 Jun 2026 14:49:41 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D443C048
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:49:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830981; cv=pass; b=S0IR8QMcWPY4PopSt+I3dx09PiRn1juHvfzfzwkC3XmplSO4jmY1uZIIifv7jSVA12au4oI0qZ6x1x/R8ARERuDRoOgU7o1Wx5/A3QC5meFjEhKllpMMy0k5+eNbpY6s+spnGXxWPQRWyFWwKkl05NFCy+AhOWnwt3UKPrI6LZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830981; c=relaxed/simple;
	bh=R2RLlWKV31uw1vmm0eE8g4HAQBST/y2tQNtzmoB595w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDIxP2O9WTSuKRC6lvhBA6HBUUUPTNwFjDo6S5y5sBknZtPFy4c2GIHdKWpS5pW3Gf655Tr80BjUZW9wZs6U9ZuAk1UTHBdXF54EprFGMtCExdfHl+UGVEBbRU6Y6wH/h3qd4JI5ahQBVOrS9HX8BfqiT+31aP3r05h/KVLXhK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eguBgHH2; arc=pass smtp.client-ip=209.85.208.174
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39669bcaadfso50498091fa.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 07:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782830978; cv=none;
        d=google.com; s=arc-20260327;
        b=jB/aG5g98t/+wObYbSXi6nbbpZ5PbjYHXiHlFht8QhtRCs+hSndOued+427RyhupKC
         JCqiuo9NtBtvbG3+7tWRGHiTBG2rdSef5gQvmBJTHnp6tYo9YauiW6oi1w0pqNWy37t3
         7UhMNMJQdZYlzvJN4Q2KPWGWjf+qFE+HyvNKrMEQoKI5BEMbHAmwN6x/e2rnGSFm8VTO
         h0RSLNZ6/M8JDrY80fgslDE3nXd+8lcNCDmIPkcq/WcOVTqSn90JUSQF/HRXPgd4hBwc
         iAy1KDsl12yHvMfxBhiU2LPWbwzaIlDBq/zC3qhNH7i+VIjf4sF0Or55tNE4m7q25ZGC
         9eEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        fh=nGVrGW5UNFp2Qduqf2MmTvd5ZfCVmsHuIyF9aZWVbUk=;
        b=J08zWF9iSIYJdjqT47B97xNrdSNa2ORwrm1oaMK3uAwFG4lcS3PceoB+MyQgC771md
         IDsIffhV2KllTjpOLO85dS0Z41g5Q2HLHhzLYAOzCJ39RIV0FXjkUzuctWcmygUuWnQJ
         Ne93pP2nZTZiwUUK/eZLRpquW/ERFanNjE/JbTDiUUV19eLiUS2gqv9Ji8LTxRzEsFdI
         t5dbsBShqhycUDddU8rtyvNwuM9f4o/DUH1YvMZ5EialQOaZBAvKn7zCCV55z2mAZ/ii
         YBlmBL5ixBHD8Dzrwh/yeEbNfVWXP0BV+BACAQr7OER+/3BqqJu6g0qJZNe0sihja2Pi
         7AGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782830978; x=1783435778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        b=eguBgHH2CoPRAyRaOi3uiaGSli4ODNgt+uvPY+h/SIbi3UUzw5fgIYyM6JQzztjeNV
         3JlZ/ToxMazHgtcSpYy6Wanx8ZqhDUqqumustyQxJN+22k7vxLd4LMYm7+P0yLfn8pQ9
         JmK4CXxkJxFZX5JST3Z2ucXmDLXruN8OwppFZNOl6Ue/Rze31PgrmjMVcdVChqaVzkn3
         9z6twiYp4Zo1H82GIHWlqKbcTI38vd2yEWEiZYcXIzue3/HMx3mwR50ZIJUVf2D/Y4gU
         v2SGLfGE48Xhlw6IlpE/3my5ZFDfLd1udwdgHT/iCfuo1uBXsQroYQOJpyClQUxBsTNu
         CwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830978; x=1783435778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        b=aSvCDNt1ro+XZ2AeSvPd7QrQzD6uRmpo8UfJoxaPNabSRSXJUHRWoaOwDA4ij2juB8
         wbY0alQMHImG8e7k4X95ks959VF5fBV/si0ivx/ruBh4CFBK5M5ZhGu+OopsBziVfEyW
         Ku7Dbzju5XgZTf0v5wBrHvGX9V/dr61W7SDwNj4kxe4xd6iXH7ab173H6lHdjmfJwhXC
         c/+TZ5MR7pVQTZKVb+2X1lBCXE0NTMRFE3G6u8045FpVt0JO8Z5ENi6ghmcnaqT7B3eF
         YMozPGE8FFe9Uc9FTV/0kXlsEEZmB18q5NyUDRmNUBXdTc+6mmEh9K9pwH5t7MKg/EWM
         Zlkw==
X-Forwarded-Encrypted: i=1; AHgh+RoMSBAqofGmVIiVjidKesNUz1jJldjjwUcoHRCuDD4vgcvrHWIY72o+zvgv+LVxdlFouvdgZRXVTN5Bjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5R1lGingBuM9rdBDd2MXD/a7jmt5ObM8drZz6lwvh6YdWaLkp
	rp0yjmKLXjfmhznRigiDSt8HTCAaXTqsKMQsJYqLS6mInmMcg9uOX6QUtyqlFnlMFH8e5+AeDNt
	GEzsWkoV00lN1O1eyiTlXQv7OWv2UyeA=
X-Gm-Gg: AfdE7clwNl+hWJih77joOA9VUH9ANTihtJUepf/ukxXe6oHfh1fxTjbJOh9gTnvnoKM
	EoC1IluyCIGzYh3DDbJM01NkxX5MBWkiMFaK8vJJ0UYo3pCghD5mTqKt7iApL897wKddvAoIkLO
	HyNKQHag1PzsVNTTpi5t1jeohfioL95S6COLSCBoHbGtsO+R9XiJoOm8xPJsshzlmsYPN1hcjD3
	KdtNmURHLpJ1YAAFRIw/POytDQQbAOXu6ZqkHIzX3vgFL66kloXnQWIXnnGPGNIvPmOTOA1vy3D
	75cgRiuDRd7xp95djCQq0SEQZh9BM1Ih/xbkTvHh6XhnmDJy2236BorUEYYeD+SoB2rBFP+DHDD
	gR4GBvmIp13d++jZE8Vgg
X-Received: by 2002:a05:6512:640e:b0:5ae:b6cf:2869 with SMTP id
 2adb3069b0e04-5aebdb9485emr981524e87.23.1782830977995; Tue, 30 Jun 2026
 07:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aj5KJEIsTl6IK0nX@gmail.com>
In-Reply-To: <aj5KJEIsTl6IK0nX@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 30 Jun 2026 22:49:00 +0800
X-Gm-Features: AVVi8CeNolHc0bWFWi94se6V_El3cArCALeJfgf0e7sVp8JXgJSa3XDzBUrtcNM
Message-ID: <CAL+tcoA6=_paEdqWaY7-VHdBeAxEFeMCfTECAEGv3C6ZqFUNSw@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] LPC 2026: System Monitoring and Observability Microconference
To: Breno Leitao <leitao@debian.org>
Cc: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, 
	linux-mm@kvack.org, iipeace5@gmail.com, gavinguo@igalia.com, 
	linux@jordanrome.com, amscanne@meta.com, sj@kernel.org, gpiccoli@igalia.com, 
	Daniel Gomez <da.gomez@kernel.org>, mfo@igalia.com, platform-driver-x86@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15487-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:linux-acpi@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kernel-team@meta.com,m:linux-mm@kvack.org,m:iipeace5@gmail.com,m:gavinguo@igalia.com,m:linux@jordanrome.com,m:amscanne@meta.com,m:sj@kernel.org,m:gpiccoli@igalia.com,m:da.gomez@kernel.org,m:mfo@igalia.com,m:platform-driver-x86@vger.kernel.org,m:acpica-devel@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kerneljasonxing@gmail.com,linux-hwmon@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,meta.com,kvack.org,gmail.com,igalia.com,jordanrome.com,kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerneljasonxing@gmail.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,lpc.events:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F1246E594A

On Fri, Jun 26, 2026 at 5:56=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> We are pleased to announce the Call for Proposals (CFP) for another
> edition of  System Monitoring and Observability Microconference, this
> time at the 2026 Linux Plumbers Conference (LPC), taking place in
> Prague, Czechia, from Oct 5-7, 2026.
>
>   https://lpc.events/event/20/sessions/262/
>
> This microconference provides a valuable forum for key engineering areas
> such as:
>
>    - Kernel Health and Runtime Monitoring
>    - Hardware Integration and Error Detection
>    - Correlation of Issues (crashes, stalls, bugs)
>    - Virtualization Stack Monitoring
>    - Memory Management Monitoring and Observability
>    - Anomaly Detection Algorithms for System Behavior
>    - Automated Analysis, Remediation and post mortem analyzes
>
> The purpose of each talk is to share challenges and discuss potential
> improvements. Sessions will last 20 to 30 minutes and aim to encourage
> brainstorming and open dialogue about ongoing issues rather than
> delivering immediate solutions.
>
> The conference acts as both a knowledge-sharing platform and a strategic
> venue for guiding the future of kernel technologies to better meet the
> demands of large-scale infrastructure.
>
> We invite you to submit your proposals here:
>         https://lpc.events/event/20/abstracts/
>
> Please select track "Linux System Monitoring and Observability MC"

A kind reminder: at the bottom of the page [1], please click the
'Submit new abstract' button so that you will be able to quickly
submit a new proposal. (Admittedly, it's a bit easy to miss the entry
especially for the newcomers)

If you have any questions/suggestions/problems, please do not hesitate
to contact Breno or me.

Again, proposals are greatly appreciated :)

[1]: https://lpc.events/event/20/abstracts/

Thanks,
Jason

