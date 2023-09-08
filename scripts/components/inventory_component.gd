extends Node


@export var inventory: InventoryResource

@onready var slots = inventory.items


func add_item(slot_resource: ItemSlotResource) -> void:
	if inventory.size > slots.size():
		slots.append(slot_resource)

func delete_item(idx: int) -> void:
	slots.remove_at(idx)

func find_item(item: ItemSlotResource) -> int:
	return slots.find(item)

func has_item(item: ItemSlotResource) -> bool:
	return slots.has(item)
