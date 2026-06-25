Return-Path: <linux-hwmon+bounces-15334-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wiC3HzkOPWrJwQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15334-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 13:17:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998B6C5082
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 13:17:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VTkKtV5a;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15334-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15334-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC4E63028C90
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 11:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F4C3D8116;
	Thu, 25 Jun 2026 11:17:04 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D893D811E
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 11:17:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386224; cv=none; b=JShNFiNdnW2behdJ4WoOkN1ydMF7ok+08B2Avwnl8JX3M/r9mbM9Fxf18G8Mj8suFjZTnwOCDNhtf7D/A9DMZxGKCZV/DZEmCz7bI9dNpvorXFdwb2xvWcKPsyyQhitZnIt6U8G/aa9v6DUjNpIUNer6EH3kaLV8rgjUNp+w8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386224; c=relaxed/simple;
	bh=oQHpMP4mZpVXB/dic7XmBtsJFQ5/0Yp2ocCSPKakpAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UyEujN2Ki/nxoczhEHfErM2CH3WwIFjFkmWdROdyXHjwcVAc3qaMNNySeaUrFN+y4wWnzknw15Bcbf26LVAG9ggf+9Zc99oSYYyvR9DpkyhPVZuB8HqzvgOz7P+jsZfAxUyHSpY+8cU9nLsQSv3+A5QanTE/UwIB2XpMdngbLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTkKtV5a; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46066e640easo1368654f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782386220; x=1782991020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t8MKmcF0nT49i2GawTpf7NpORM+r6MBMmeMYSKcKc/0=;
        b=VTkKtV5a58U7TmtnpQlA11NqmELvxpOtcwjECA1lFIDCUJipk5xce+sUMtlTKq8LDX
         RFyB7XFs4MHysW8J3KAddqah7XjOwTown/4pyRVW/UkyvmQ3xT0boKTOuA9wu8A3Yp3C
         GLJ4kAfPMW2c5KsxumZy6FJtua2Z9Ka3LnlbFBzgjIZBz+6q4SwwTibHbXWo8EHG8v7D
         QzoV4T7oLtu/NMQQQ3xQvf1RDS9iiPED3X8RiMADdH638BZ8TMmGS59OeAE3Dk3844aS
         UKWW5LtLfpZ6rHoPhhQ0JdseYoGMYCyANXE/NEDFiwE5URA0QzaSCHQ35N6dlfOHQOTl
         n3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386220; x=1782991020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8MKmcF0nT49i2GawTpf7NpORM+r6MBMmeMYSKcKc/0=;
        b=g9ReVMXVCihkDdxclmlPyUP+iR99c+3TxrqZsmfd0ZzSdbaGrhv674wilSZxx3viPD
         ULc6yO4zqLJfjo+N8Pl40OLoPkkTxfaVs/xv4LqljuzAL5H+urFsOUD00Dlcv3cb9fP4
         vN2GNfjoU6jMdIks0dg3MHhoGAKPvr6LsomZ0mSp8/BxhTOmWfs/3ac1hV8/n0R7isIb
         hdN1+lmhLIby/Hiow4+90pazndGmCrAHgtLRWmU47gbTwxnt9z/wGEGHirLp8cbtU6k0
         z8zqHhYuPvg+H5gLxbZiQk7tEXgeHfIxAS2fd4Zf0UN1gsKLH93hbIWb48A5fo5WMKQs
         PBEw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0hKazO0pVP9jaJvVeDY717y13OnOkuU1kZiXwcO3jjDcCcljSQk9WMT3rQCu31RE6xbEVN00uf8ZpBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXqLhCmfYXS1QbGLKh5GoRJe/FbaFu219tmVQT+r/I2olLxLZT
	9DKPjgGCmgrbzjerc174du5A07oDl4zCc3bsFaQ6DTnsxveAplJyoESe
X-Gm-Gg: AfdE7ckfpyuIGrDzaf6PVPpBZFp+y/E+ywKBBAhyoDODAm3rqUC640GGuNokPKMfEf6
	m7lXeLFbVZsc9rtuM6Q1TQ7/TQfoj8IqrjMYGTuQkIkwFZfi+I0Yl46bU3or75vAwqoWic/my3F
	+2OOloNIq8U79bHot91bIf5cv/NK/Jn+wkyL49zMRtQfuZOCGPDt2AVjAQZBNv/a2+i4V5MEBZ3
	EUxGFhzUqTisK2lSLLmeiMZXcAJIbpzit71YZqFa9OlFQY2zkYcM09NOXlI2ZkIk1byyfiurBtB
	iPTeGzbTyYYhjM+56fBc5ljPAtnSfm+nuVSy4OeYCELXbldZeLWiAKgYXmJx/TDTmQlYPXHfEgB
	fl4ek4bD5eBF/mEynsdNMc4zzJde20RId/geRa1IViaQjafj53UwKa2pi3Oe0zy5Q8DTzZY1S8B
	bZNcDC7f1a3SOPDSlwdfAHBV5VcOg0lspOVESkSQ3yY/o7m5IBscoBlvo4B/BA2oMiEyVXKjtjS
	q/F4kyM
X-Received: by 2002:a05:6000:460f:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-46dbc1bc950mr3169703f8f.0.1782386220097;
        Thu, 25 Jun 2026 04:17:00 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960991sm6919343f8f.6.2026.06.25.04.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:16:59 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <66945d22-17e4-4856-9704-8256650c4b25@gmail.com>
Date: Thu, 25 Jun 2026 12:16:58 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
To: hehuan1@eswincomputing.com, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com,
 dongxuyang@eswincomputing.com
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061214.1648-1-hehuan1@eswincomputing.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260625061214.1648-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15334-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hehuan1@eswincomputing.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ningyu@eswincomputing.com,m:linmin@eswincomputing.com,m:pinkesh.vaghela@einfochips.com,m:luyulin@eswincomputing.com,m:dongxuyang@eswincomputing.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,eswincomputing.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1998B6C5082

Hi Huan,

On 6/25/26 07:12, hehuan1@eswincomputing.com wrote:
> +config SENSORS_EIC7700_PVT
> +	tristate "Eswin EIC7700 Voltage, Temperature sensor driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	depends on HWMON

You already put SENSORS_EIC7700_PVT inside the 'if HWMON .. endif', so
you don't need the 'depends on HWMON'. It creates a duplicate
dependency.

- Julian Braha

