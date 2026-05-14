Return-Path: <linux-hwmon+bounces-14053-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEyLJVY2BWp9TQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14053-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 04:41:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEDB53D1DB
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 04:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16609300E6B3
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 02:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5411C2DF15C;
	Thu, 14 May 2026 02:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="CZoCMzPy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tVHc7gKO"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23E2E7BB6;
	Thu, 14 May 2026 02:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726479; cv=none; b=lCuC5Qbpu9S/1Fm6LleYqUkGRRjL+lPTObW+zEZqP28bZqsNxfCM+SjYAjXALedUUbKuuHqiiNBNbaLKN5xhbgfXTJvPTib07GbzmVIR3iOjoD59QL5rtj52K8C5vss8Sf9KfMvB+RHAIzoql0bkrMj0C1+OA25zfwEBVqVXM74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726479; c=relaxed/simple;
	bh=Nw9JtVP1s8od/ijiYuB37CXXeNnbPz3o3u63f9b3bH0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=K0LVFNf/P1hbaoyIKG25oWtV2z2WQ2i2VbXEVQyWeO0pYlbvOq2geuAahmjBWjUhWa7K4+jk2Ccnl2mn6sMCsopxlP/rl7gSEl/qID5bFvMk5ktHZwKg8woXWh6bdvYKCWTojdcBul+NbyRPaRPAODx4xJptt9Vbq9NM09qYZ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=CZoCMzPy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tVHc7gKO; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0E77B7A00C3;
	Wed, 13 May 2026 22:41:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 13 May 2026 22:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778726475;
	 x=1778812875; bh=Vq73y+WmP6nVLitdN2oqIhf59m+ynOnqdrkn0OTK0lk=; b=
	CZoCMzPyeLqx10lgKOOWvV1Fv0F02n84uoOkBY5LbZeiOrPSQVrzXDsprorq1pQ4
	js7KK00NqbAYYds19tPOvZDwz7iRtXRjR6BA7boq0C0gqGL7iSAHgd3Dgqtx0hSx
	dCd75UWgZVpxW671f8R2BN52lzmNs24Ai2tHtla//09YlRA0DlrYok4q8pJtTxsB
	ZZ6ETfuhLNp5KcMklE33N/xA5/8iNE0O1slx8wGzf34pCNs3BvvjhprIopRlj2Ba
	SZC0UhQUQmJsL2CWhjHqOdp/tpzQJeOoPtVEpvd2twlEx5KqIV3M362lc+545WUp
	s+g8Zt70upGw3G5WDqq+0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778726475; x=
	1778812875; bh=Vq73y+WmP6nVLitdN2oqIhf59m+ynOnqdrkn0OTK0lk=; b=t
	VHc7gKOf6tA5Bzdrak6eNc2usvZBRlXr/GTXT60/MAyBdb3+Kk7HjPGk3ioK8U4E
	8kjMv3ArfjYEKk2HqSp8cHHSYXKCbiVo7D9wJ7O9eVz6t0b84hF8YvVbk/OS7Y0t
	DkmtZgs637vFMxizN4JEKfI5NXsbIBXDa71wgcEwlQ98XqiiwhLiv48wZ0Qywm4N
	/uEeowpcLwbH4IKavccZs5ItpPrSEuzhwZBZBXh8C76DD/y2B6thzof/0yru9wEA
	4fnXIg6oAnhNS+dj8HLakr0kOSg0vRoHf4KWoeNLOaxiAi1k8r/bihpF7kJJRO02
	OLmxS5FqL/bpf+TyQ3aMg==
X-ME-Sender: <xms:SzYFajIGU3SxlEyKB-LkVvR32JPwBOqlg5bbQAQj8Q1_VnsoPAiekw>
    <xme:SzYFah9jkQzfrt_e1mO59RYDljKN3jSZBTBgB2VHJg7e8ZxePP7p5T5yHq6oyYQvf
    RyXwHsUJJAncS-zeWWkGH33f63I_rEG21UFs_kBd6iJ3f9JasWJMEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdeifeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejre
    dtredttdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehte
    eghedthedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgv
    rhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhhpghkihhnghesudeifedrtghomhdprhgtphhtthhope
    hlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehlihhnuhigqdhhfihm
    ohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SzYFavxFf0Mqsgs0QT2zrF8tmC0zfCwU3LJi0EJ6suYqlm1ktt-T3g>
    <xmx:SzYFaiuC93CgRZLB2D4Ykqh5OoHu0AHj2c01aa2B2MOQYOvxO4-DCg>
    <xmx:SzYFas0h5EllWDeshQi61a5cJlRYUbbFz4Qhyuqf-Baerk-MI5X_nA>
    <xmx:SzYFat94qXYjk0_EQ_BAkFvZ5f6ulOToFPWzDk6f2UDyrRzWA-Yv2Q>
    <xmx:SzYFau6fMj7Xtejyd9FTKwjk8zegHbPdqWvYSEjfl7SyaLPfnEFq6Iwf>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B18002CE0078; Wed, 13 May 2026 22:41:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AywN1WyZdyFR
Date: Wed, 13 May 2026 22:40:55 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Guenter Roeck" <linux@roeck-us.net>, Kean <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <18f59754-c7cd-4fe5-b670-b7e7125b5679@app.fastmail.com>
In-Reply-To: <80804838-5526-4096-b0ee-d6b46bbe0ecb@roeck-us.net>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260514011411.4167069-2-rh_king@163.com>
 <80804838-5526-4096-b0ee-d6b46bbe0ecb@roeck-us.net>
Subject: Re: [PATCH 1/3] hwmon: lenovo-ec-sensors: Fix EC signature check logic in
 probe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9BEDB53D1DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[squebb.ca,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm1,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-14053-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	FREEMAIL_TO(0.00)[roeck-us.net,163.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson-lenovo@squebb.ca,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[squebb.ca:email,squebb.ca:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,app.fastmail.com:mid,messagingengine.com:dkim,lenovo:email]
X-Rspamd-Action: no action

Hi Guenter,

On Wed, May 13, 2026, at 9:37 PM, Guenter Roeck wrote:
> On 5/13/26 18:14, Kean wrote:
>> The probe function reads a 4-byte signature ("MCHP") from the EC to
>> verify it is a Microchip EC before binding the driver. The condition
>> uses && (AND) to check if each byte differs from the expected value:
>> 
>>    if ((byte0 != 'M') && (byte1 != 'C') && (byte2 != 'H') && (byte3 != 'P'))
>> 
>> This rejects the device only if ALL four bytes are wrong simultaneously.
>> A partially matching signature (e.g. "MXXX") would pass the check and
>> cause the driver to bind to a non-Microchip EC, as long as at least one
>> byte matches the expected value.
>> 
>> Change && to || so the driver is rejected when ANY byte does not match
>> the expected "MCHP" signature.
>> 
>> Signed-off-by: Kean <rh_king@163.com>
>> 
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> As with the other patches: How do I know that this review really happened ?

I confirm I did it.
For the series:
Reviewed-by: Mark Pearson <mpearson@lenovo@squebb.ca>

Mark

>
> Guenter
>
>> ---
>>   drivers/hwmon/lenovo-ec-sensors.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
>> index 8681bbf6665b..a32b1f2c6a3a 100644
>> --- a/drivers/hwmon/lenovo-ec-sensors.c
>> +++ b/drivers/hwmon/lenovo-ec-sensors.c
>> @@ -537,9 +537,9 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>   	outw_p(MCHP_SING_IDX, MCHP_EMI0_EC_ADDRESS);
>>   	mutex_unlock(&ec_data->mec_mutex);
>>   
>> -	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') &&
>> -	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
>> -	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
>> +	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') ||
>> +	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') ||
>> +	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
>>   		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>   		return -ENODEV;

